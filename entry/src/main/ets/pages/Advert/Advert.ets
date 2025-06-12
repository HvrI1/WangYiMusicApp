import { ImmersionEnum, USER_INFO } from '../../constans'
import { AdvertInfo, AdvertInfoModel, User} from '../../pojo'
import { router } from '@kit.ArkUI'
import { queryAdvertById, queryAllAdvert } from '../../api'
import { Result } from '../../commons/type_common'


@Entry
@Component
struct Advert {

  @State userInfo:User = {} as User

  //广告数据对象
  @State advert:AdvertInfo = new AdvertInfoModel({} as AdvertInfo)

  //获取顶部高度
  @StorageProp(ImmersionEnum.APP_TOP_HEIGHT)
  topHeight:number = 0

  //定时器id
  timeId:number = -1

  // 获取广告
  async getAdvertById(){
    let res:Result =  await queryAdvertById(3)
    this.advert = res.data as AdvertInfo



  }


  //定时方法
  interval(){
    this.timeId = setInterval(()=>{
      if(this.advert.duration>0) {this.advert.duration--}
      else {
        if(this.userInfo){
          router.replaceUrl({url:"pages/Index/Index"})
        }else {
          router.replaceUrl({url:"pages/Login/Login"})
        }


      }
    },1000)
  }
  getUserInfo(){
    this.userInfo =  AppStorage.get(USER_INFO) as User
    console.log("======="+JSON.stringify(this.userInfo))
  }

  //页面构建时
  aboutToAppear(): void {
    //拿到用户信息
    this.getUserInfo()
    //异步调用接口获取广告资源
    this.getAdvertById()
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
        Span(this.advert.duration+"秒")
        Span(" ")
        Span("跳过")
          .onClick(()=>{
            if(this.userInfo){
              router.replaceUrl({url:"pages/Index/Index"})
            }else {
              router.replaceUrl({url:"pages/Login/Login"})
            }
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
    // .padding({top:this.topHeight})
    //这里背景图不能是组件，因为如果是组件会被padding限制内容而不是沉浸式了，所以要在组件上设置背景
    .backgroundImage(this.advert.advertUrl)
    .backgroundImageSize({width:"100%",height:"100%"})
    .expandSafeArea([SafeAreaType.SYSTEM],[SafeAreaEdge.TOP,SafeAreaEdge.BOTTOM])
  }
}