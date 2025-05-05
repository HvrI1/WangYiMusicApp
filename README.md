# 开发笔记
# 一、创建项目并添加到远程仓库
1. 在目标路径下新建项目
2. 在github上创建一个远程仓库
3. 在远程仓库中基于main分支创建dev开发分支
4. 在项目中vsc选项卡初始化本地仓库
5. 在项目git选项卡中选择manage remotes添加远程仓库地址
6. 在项目git选项卡执行fetch拉取最新代码和分支
7. 在项目git选项卡选择pull拉取并合并分支:因为是新仓库，默认我选了一个创建remand.md文件，将他拉取并合并下来
8. 本地分支切换到dev开发分支
# 二、初始化搭建项目基础目录结构
1. 创建项目目录:在ets目录下创建api、constans、commons、service、pojo、models、utils、components目录。
2. 在刚创建的所有目录下新建index.ets文件用于后续统一导出。
3. 提交推送"项目搭建和目录初始化“
# 三、开屏广告功能的开发
## 3.1、沉浸式设置
开屏广告应该是覆盖手机屏幕的，所以这里需要先在**生命周期**设置沉浸式。
### 3.1.1沉浸式设置思路
1. 开屏广告应该是另外的一个窗口，也就是子窗口。
2. 而子窗口的大小我们不知道，我们需要拿到当前窗口上面状态栏和底部操作栏的高度。
3. 这个高度在windowStage里面有，所以我们在搭建舞台生命周期中逻辑应该是先不要加载页面。而是先执行
设置沉浸式，自动登录验证等操作。然后加载页面loadContent的操作放在自动登录验证的逻辑中。
### 3.1.2设置沉浸式
1. 由于我们要将高度数据存入appStorage,所以我们在constans目录下创建一个枚举文件system_info.ets，在文件中定义并导出ImmersionEnum枚举类
注意:在/constans/index.ets中集中导出
```extendtypescript
//统一导出常量
export * from "./system_info"
```
```extendtypescript
export enum ImmersionEnum{
   APP_TOP_HEIGHT = "app_top",
   APP_BOTTOM_HEIGHT = "app_bottom"
}
```
2. 在生命周期声明方法setImmersion(windowStage: window.WindowStage)
```extendtypescript
//设置沉浸式的方法
function setImmersion(windowStage: window.WindowStage){
  //获取主窗口对象
  const mainWindow =  windowStage.getMainWindowSync()
  // 添加全屏设置
  mainWindow.setWindowLayoutFullScreen(true) // 设置沉浸式开启
  // mainWindow.setWindowSystemBarEnable([]) // 隐藏所有系统栏
  //获得窗口避让区域的头部区域，并将结果转为vp,注意此处的window是导入的包
  const topHeight = px2vp(mainWindow.getWindowAvoidArea(window.AvoidAreaType.TYPE_SYSTEM).topRect.height)
  //获得底部区域，和上面同理,注意这里的AvoidAreaType枚举类型选择和上面不一样
  const bottomHeight = px2vp(mainWindow.getWindowAvoidArea(window.AvoidAreaType.TYPE_NAVIGATION_INDICATOR).bottomRect.height)
  console.log("头部高度",topHeight);
  console.log("底部高度",bottomHeight);
  //获得高度后，我们需要存入appStorage中
  AppStorage.setOrCreate(ImmersionEnum.APP_TOP_HEIGHT,topHeight)
  AppStorage.setOrCreate(ImmersionEnum.APP_BOTTOM_HEIGHT,bottomHeight)
}
```
3. 在onWindowStageCreate中执行，注意：由于设置了全屏沉浸式，后续的所有页面的高度"100%"都是占满屏幕的。
4. 对应页面如果不要沉浸式，需要手动在最外面的组件的margin的top设置高度为topHeight。背景颜色遮不遮就看使用的是marin还是padding
## 3.2、搭建广告页
### 3.2.1广告页UI
思路：我们首先要想一下，这个页面大概是什么样子。首先，广告页不一定要展示广告，也可能展示用户自定义的开平背景。
而这个页面最简单的的组件元素无非就是背景，倒计时跳转按钮两种。而背景可以是视频也可以是图片，无论是哪种都是一个
资源，而按钮是一个组件悬浮于背景之上。所以我们需要可以先创建一个广告对应的实体模型。组件就在当前面页面实现。
1. 创建Advert目录和Advert页面
2. 在/pojo/Advert.ets中定义广告实体类型，后续所有关于广告的类型都在这里面,注意：我们这里定义的类型是从前端开发
思路来定义的，广告这种数据肯定是后端存储的，所以广告数据应该是通过网络请求过来的，类型应该和后端保持一致。这里我们就
先行定义，在实际工作时应该根据请求响应的类型定义。
```extendtypescript
export interface AdvertInfo{
    isOpen:boolean//是否需要开启广告
    adVertName:string//广告的名字
    advertResoure:ResourceStr//广告的资源地址
    time:number//广告的时长
}

export class AdvertInfoModel implements AdvertInfo{
  isOpen:boolean//是否需要开启广告
  adVertName:string//广告的名字
  advertResoure:ResourceStr//广告的资源地址
  time:number//广告的时长

  constructor(advert:AdvertInfo) {
    this.isOpen = advert.isOpen
    this.adVertName = advert.adVertName
    this.advertResoure = advert.advertResoure
    this.time = advert.time
  }
}
```
3. 广告页UI代码如下
```extendtypescript
import { ImmersionEnum } from '../../constans'
import { AdvertInfo, AdvertInfoModel } from '../../pojo'
import { router } from '@kit.ArkUI'


@Entry
@Component
struct Advert {

  //广告数据对象
  @State advert:AdvertInfo = new AdvertInfoModel({
    isOpen:true,
    adVertName:"test",
    advertResoure:$r("app.media.advert_test_background"),
    time:5
  })

  //获取顶部高度
  @StorageProp(ImmersionEnum.APP_TOP_HEIGHT)
  topHeight:number = 0

  //定时器id
  timeId:number = -1

  //定时方法
  interval(){
    this.timeId = setInterval(()=>{
      if(this.advert.time>0) {this.advert.time--}
      else {router.replaceUrl({url:"pages/Index/Index"})}
    },1000)
  }

  //当页面展示时开始运行
  onPageShow(): void {
    this.interval()
  }

  //在页面销毁时清除定时器‘
  aboutToDisappear(): void {
    clearInterval(this.timeId)
  }

  build() {
    Column(){
      Text(){
        Span(this.advert.time+"秒")
        Span(" ")
        Span("跳过")
          .onClick(()=>{
            router.replaceUrl({url:"pages/Index/Index"})
          })
      }
      .fontSize(12)
      .alignSelf(ItemAlign.End)
      .margin({top:20,right:20})
      .padding(5)
      .borderRadius(10)
      .backgroundColor($r("app.color.button_background_gray"))
      .opacity(0.5)
    }
    .height('100%')
    .width('100%')
    //这里我们希望背景全屏展示，所以使用padding,
    .padding({top:this.topHeight})
    //这里背景图不能是组件，因为如果是组件会被padding限制内容而不是沉浸式了，所以要在组件上设置背景
    .backgroundImage(this.advert.advertResoure)
    .backgroundImageSize({width:"100%",height:"100%"})
  }
}
```

### 3.2.2广告后端接口请求
1. 后端接口实现(这里省略)
2. 导入工具类(首选项，axios)
3. 在modile.json5中添加网络权限
```json5
    "requestPermissions": [
      {"name": "ohos.permission.INTERNET"}
    ]
```
4. 查询全部广告接口http://【本机ip/公网ip】:8080/advert/findAllAdvert
5. 根据id查询广告接口http://【本机ip/公网ip】:8080/advert/findAdvertById?id={需要传入id}
6. 根据后端响应的数据类型定义实体（分离接口和实现类）
/pojo/Advert.ets
```extendtypescript
export interface AdvertInfo{
  id: number | null,
  advertName: string,//广告的名字
  advertUrl: string,//广告的资源地址
  linkUrl: string| null,
  type: number| null,
  position: string| null,
  duration: number,//广告的时长
  startTime: Date| null,
  endTime: Date| null,
  sortOrder: number| null,
  isOn: number| null,//是否需要开启广告
  clickCount: number| null,
  createTime: Date| null,
  updateTime: Date| null
}
```
/pojo/impl/AdvertImpl.ets
```extendtypescript
export class AdvertInfoModel implements AdvertInfo{
  id: number | null = null;
  advertName: string;
  advertUrl: string;
  linkUrl: string | null= null;
  type: number | null= null;
  position: string | null= null;
  duration: number;
  startTime: Date | null= null;
  endTime: Date | null= null;
  sortOrder: number | null= null;
  isOn: number | null= null;
  clickCount: number | null= null;
  createTime: Date | null= null;
  updateTime: Date | null= null;

  constructor(advertInfo:AdvertInfo) {
    this.id = advertInfo.id;
    this.advertName = advertInfo.advertName;
    this.advertUrl = advertInfo.advertUrl;
    this.linkUrl = advertInfo.linkUrl;
    this.type = advertInfo.type;
    this.position = advertInfo.position;
    this.duration = advertInfo.duration;
    this.startTime = advertInfo.startTime;
    this.endTime = advertInfo.endTime;
    this.sortOrder = advertInfo.sortOrder;
    this.isOn = advertInfo.isOn;
    this.clickCount = advertInfo.clickCount;
    this.createTime = advertInfo.createTime;
    this.updateTime = advertInfo.updateTime;
  }
}
```
7. 编写API调用后端接口
/api/advert.ets
```extendtypescript
export const queryAllAdvert = () =>{
   return RequestAxios.get<AdvertInfo>("/advert/findAllAdvert")
}

export const queryAdvertById = (id:number) =>{
  return RequestAxios.get<AdvertInfo>(`http://localhost:8080/advert/findAdvertById?id=${id}`)
}
```
8. BUG处理：
注意axios请求时不能使用localhost
```extendtypescript
export enum RequestInfo{
  BASE_URL = "http://192.168.0.100:8080" //正确
  //BASE_URL = "http://localhost:8080" //错误
}
```
# 四、首页的设计和实现
## 4.1、首页的分析
1. 首先首页可以看作时一个tabs选项卡页面，里面有四个选项，对应四个页面，
2. 而播放的组件是固定存在，所以播放组件是跟页面在一起的。
3. 首页“推荐”选项卡的页面里面又有一个选项卡tabs组件对应四个页面
4. 首页推荐的搜素是固定在推荐页面中的。
## 4.2、首页实现
1. 首页只有一个组件那就是tabs，需要通过foreach遍历数组，把显示的四个页面遍历出来
```extendtypescript
//属性：底部导航数据
  tabsData: TabClass[] = [
    {
      title: '推荐',
      name: 'recommend',
      icon: $r("sys.symbol.service")
    },
    {
      title: '漫游',
      name: 'roam',
      icon: $r("sys.symbol.cloud")
    },
    {
      title: '笔记',
      name: 'note',
      icon: $r("sys.symbol.doc_plaintext")
    },
    {
      title: '我的',
      name: 'mine',
      icon: $r("sys.symbol.person")
    },
  ]
```
```extendtypescript
Tabs({index:$$this.currentIndex}){
      ForEach(this.tabsData,(item:TabClass,index:number)=>{
        TabContent(){
          if (item.name==="recommend"){
            //TODO:推荐的组件
            Text("推荐的组件")
          }else if(item.name==="roam") {
            //TODO:漫游的组件
            Text("漫游的组件")
          }else if(item.name==="note"){
            //TODO:笔记的组件
            Text("笔记的组件")
          }else {
            //TODO:我的的组件
            Text("我的的组件")
          }
        }
        .tabBar(this.tabsBarComp(item,index))//自定义选项卡组件
      })
    }
    // .margin({top:this.appTopHeight})//如果背景不遮盖就选margin，如果背景要遮盖，就选padding
    .height('100%')
    .width('100%')
    .backgroundColor("#9966bb")
    .barPosition(BarPosition.End)
    .barBackgroundColor("#ffffff")
```
2. 注意这里还没有处理字体大小，颜色，文字内容的分层处理
3. 注意点有两个：
a.TabContent遍历出来有四个
b.需要有一个状态变量currentIndex双向绑定index，去改变选中的颜色



