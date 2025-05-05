import { TabClass } from "../../../commons"
import { RecommendDetail } from "./RecommendDetail/RecommendDetail"

@Preview
@Component
export  struct Recommend{

  //状态：当前选择的索引
  @State currentIndex:number = 0 //默认选择第一个组件


  //属性：顶部导航数据
  tabsData: TabClass[] = [
    {
      title: '推荐',
      name: 'recommendDetail'
    },
    {
      title: '音乐',
      name: 'music'
    },
    {
      title: '播客',
      name: 'player'
    },
    {
      title: '听书',
      name: 'listenBook'
    },
  ]


  //组件：自定义选项卡
  @Builder
  tabsBarComp(item:TabClass,index:number){
    Row(){
      Text(item.title)
        .fontSize($r("app.float.tab_bar_font_size_big"))
        .fontColor(index === this.currentIndex?$r("app.color.tab_bar_able"):$r("app.color.tab_bar_disable"))
        .aspectRatio(1.5)
        .height(40)
        .border({width:{bottom:3},color:index === this.currentIndex?$r("app.color.tab_bar_border_background_able"):$r("app.color.tab_bar_border_background_disable")})
        .textAlign(TextAlign.Center)
        .animation({duration:100})
        .fontWeight(FontWeight.Bold)
    }
    .width("100%")
    .justifyContent(FlexAlign.SpaceAround)
  }

  //组件：头部搜索导航
  @Builder
  NavComp(){
    Row({space:10}){
        SymbolGlyph($r("sys.symbol.text_alignleft"))
          .fontSize($r("app.float.glyph_font_size_normal"))
      Row(){
        SymbolGlyph($r("sys.symbol.magnifyingglass"))
          .fontSize($r("app.float.glyph_font_size_little"))
          .fontColor([$r("app.color.text_color_gray")])
          .width(20)
          .height(20)
        //TODO:这里的placeholder应该是动态改变的
        TextInput({placeholder:"♥鲸与他的十年"})
          .layoutWeight(1)
          .placeholderColor($r("app.color.text_color_gray"))
          .backgroundColor($r("app.color.background_color_lucency"))
          .placeholderFont({size:$r("app.float.placeholder_font_size")})
          .height(30)
          .padding(0)
          .margin(0)
          .borderRadius(0)
        SymbolGlyph($r("sys.symbol.line_viewfinder"))
          .fontSize($r("app.float.glyph_font_size_little"))
          .fontColor([$r("app.color.text_color_gray")])
          .width(20)
          .height(20)
      }
      .padding(10)
      .borderRadius(30)
      .backgroundColor($r("app.color.background_color_gray"))
      .layoutWeight(1)
      SymbolGlyph($r("sys.symbol.mic"))
        .fontSize($r("app.float.glyph_font_size_normal"))
    }
    .width("100%")
    .height(30)
  }


  build() {
    Column(){
      //TODO:头部搜索栏
      this.NavComp()
      //tabs选项卡
      Tabs({index:$$this.currentIndex}){
        ForEach(this.tabsData,(item:TabClass,index:number)=>{
          TabContent(){
            if (item.name==="recommendDetail"){
              RecommendDetail()
            }else if(item.name==="music") {
              //TODO:音乐的组件
              Text("音乐的组件")
            }else if(item.name==="player"){
              //TODO:播客的组件
              Text("播客的组件")
            }else {
              //TODO:听书的组件
              Text("听书的组件")
            }
          }
          .tabBar(this.tabsBarComp(item,index))//自定义选项卡组件
        })
      }
      // .margin({top:this.appTopHeight})//如果背景不遮盖就选margin，如果背景要遮盖，就选padding
      .backgroundColor($r("app.color.tab_background_white"))
      .barPosition(BarPosition.Start)
      .barBackgroundColor($r("app.color.tab_bar_background_white"))
    }
    .height('100%')
    .width('100%')
    .padding({left:10,right:10})
  }
}