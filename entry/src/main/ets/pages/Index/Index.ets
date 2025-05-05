import { TabClass } from '../../commons'
import { ImmersionEnum } from '../../constans'
import { Recommend } from './Recommend/Recommend'

@Entry
@Component
struct Index {
  // @StorageProp(ImmersionEnum.APP_TOP_HEIGHT)
  // appTopHeight:number = 0

  //状态：当前选择的索引
  @State currentIndex:number = 0 //默认选择第一个组件


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


  //组件：自定义选项卡
  @Builder
  tabsBarComp(item:TabClass,index:number){
    Column(){
      SymbolGlyph(item.icon as Resource)
        .fontSize($r("app.float.glyph_font_size_normal"))
        .fontColor(index === this.currentIndex?[$r("app.color.tab_bar_able")]:[$r("app.color.tab_bar_disable")])
      Text(item.title)
        .fontSize($r("app.float.tab_bar_font_size_little"))
        .fontColor(index === this.currentIndex?$r("app.color.tab_bar_able"):$r("app.color.tab_bar_disable"))
    }
  }

  build() {
    Tabs({index:$$this.currentIndex}){
      ForEach(this.tabsData,(item:TabClass,index:number)=>{
        TabContent(){
          if (item.name==="recommend"){
            //推荐的组件
            Recommend()
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
    .backgroundColor($r("app.color.tab_background_white"))
    .barPosition(BarPosition.End)
    .barBackgroundColor($r("app.color.tab_bar_background_white"))
  }
}