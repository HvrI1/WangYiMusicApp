import { router } from "@kit.ArkUI"
@Component
export struct BacKNav{

  title:string = "网易云音乐"
  isShowIcon:boolean = true

  build() {
    Stack({alignContent:Alignment.Start}){
      Row({space:5}){
        if(this.isShowIcon){
          Image($r("app.media.logo"))
            .width(20)
            .height(20)
        }
        Text(this.title)
          .fontSize($r("app.float.nav_title_font_size"))
          .fontColor($r("app.color.text_color_black"))
          .fontWeight(FontWeight.Bold)

      }
      .width("100%")
      .height("100%")
      .justifyContent(FlexAlign.Center)

      Text("<")
        .fontSize(20)
        .alignSelf(ItemAlign.Start)
        .onClick(()=>{
          router.back()
        })
    }
    .width("100%")
    .height(40)
    .padding(10)
  }
}