import { SongCardClass } from "../../commons"

@Preview
@Component
export struct songCard{

  //属性：歌曲信息对象
  songInfo: SongCardClass ={
    img:$r("app.media.advert_test_background"),
    songName:"What Does It Mean to You(Remix By Binary)",
    songArtist:"Jake Miller",
    songTags: ["十万红心","1w+评论"],
    isVip:true
  }

  build() {
    Row({space:10}){
      //图片
      Image(this.songInfo.img)
        .height("100%")
        .aspectRatio(1)
        .objectFit(ImageFit.Cover)
        .borderRadius(10)
      Column(){
        //歌曲名称
        Text(this.songInfo.songName)
          .fontSize(12)
          .fontWeight(FontWeight.Bold)
          .width("100%")
          .maxLines(1)
          .textOverflow({overflow:TextOverflow.Ellipsis})
          .ellipsisMode(EllipsisMode.END)
        Row({space:5}){
          //vip
          if(this.songInfo.isVip){
            Text("VIP")
              .fontSize(8)
              .padding(2)
              .fontWeight(FontWeight.Bold)
              .border({width:1,color:$r("app.color.song_tag_background_color")})
              .fontColor($r("app.color.song_tag_font_color"))
              .borderRadius(5)
          }
          //标签
          ForEach(this.songInfo.songTags,(item:string,index:number)=>{
            Text(item)
              .fontSize(8)
              .padding(2)
              .fontWeight(FontWeight.Bold)
              .backgroundColor($r("app.color.song_tag_background_color"))
              .fontColor($r("app.color.song_tag_font_color"))
              .borderRadius(5)
          })
          //歌手
          Text(this.songInfo.songArtist)
            .fontSize($r("app.float.song_card_artist_font_size"))
            .fontColor($r("app.color.song_artist_font_color"))
            .fontWeight(FontWeight.Bold)
            .layoutWeight(1)
            .maxLines(1)
            .textOverflow({overflow:TextOverflow.Ellipsis})
            .ellipsisMode(EllipsisMode.END)
        }
        .width("100%")


      }
      .layoutWeight(1)
      .justifyContent(FlexAlign.SpaceEvenly)
      .height("100%")
      SymbolGlyph($r("sys.symbol.play"))
        .fontSize(20)
    }
    .width("90%")
    .height(50)
    .backgroundColor($r("app.color.background_color_lucency"))
    .borderRadius(10)
  }
}