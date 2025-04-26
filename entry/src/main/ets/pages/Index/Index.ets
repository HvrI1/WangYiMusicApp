import { ImmersionEnum } from '../../constans'

@Entry
@Component
struct Index {
  @StorageProp(ImmersionEnum.APP_TOP_HEIGHT)
  appTopHeight:number = 0


  build() {
    Column(){
      Text("111")
    }
    .height('100%')
    .width('100%')
    .margin({top:this.appTopHeight})//如果背景不遮盖就选margin，如果背景要遮盖，就选padding
    .backgroundColor("#9966bb")
  }
}