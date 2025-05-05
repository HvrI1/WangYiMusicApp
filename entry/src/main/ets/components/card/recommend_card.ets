import { CardClass } from "../../commons/type_common"

@Component
export struct RecommendCard{

  //属性（必传）：
  @Require cardInfo:CardClass = {} as CardClass

  //属性(可选)：播放按钮，由调用者决定是否需要
  isShowPlayButton:boolean = false

  //底部描述框颜色
  bottomColor:ResourceColor = $r("app.color.card_description_background_color")
  bottomTextColor:ResourceColor = $r("app.color.text_color_white")

  build() {
    Column(){
      Stack(){
        Image(this.cardInfo.img)
          .width("100%")
          .height("100%")
          .borderRadius(this.cardInfo.title?{topLeft:10,topRight:10}:10)
        Row({space:5}){
          if(this.cardInfo.icon){
            SymbolGlyph(this.cardInfo.icon as Resource)
              .fontSize($r("app.float.glyph_font_size_normal"))
              .fontColor([$r("app.color.text_color_white")])
              .alignSelf(ItemAlign.Start)
          }
          Text(this.cardInfo.title)
            .fontSize($r("app.float.card_title_font_size"))
            .fontColor($r("app.color.text_color_white"))
            .fontWeight(FontWeight.Bold)
            .alignSelf(ItemAlign.Start)
        }
        .padding(10)
        .width("100%")
        .height("100%")
        if (this.isShowPlayButton){
          Row(){
            SymbolGlyph($r("sys.symbol.play_fill"))
              .fontSize($r("app.float.glyph_font_size_normal"))
              .fontColor([$r("app.color.text_color_white")])
              .alignSelf(ItemAlign.End)
          }
          .width("100%")
          .height("100%")
          .justifyContent(FlexAlign.End)
          .padding({right:10,bottom:10})
        }
      }
      .width("100%")
      .height("75%")

      Text(this.cardInfo.description)
        .width("100%")
        .height("25%")
        .fontColor(this.bottomTextColor)
        .fontSize($r("app.float.card_description_font_size"))
        .maxLines(2)
        .textOverflow({overflow:TextOverflow.Ellipsis})
        .ellipsisMode(EllipsisMode.END)
        .backgroundColor(this.bottomColor)
        .borderRadius(this.cardInfo.title?{bottomLeft:10,bottomRight:10}:0)
        .padding(10)
    }
    .width("100%")
    .height("100%")
    .justifyContent(FlexAlign.SpaceBetween)
  }
}