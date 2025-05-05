
import { CardClass, SongCardClass } from "../../../../commons"
import { RecommendCard, songCard, TitleNav } from "../../../../components"
import { ImmersionEnum } from "../../../../constans"

@Component
export struct RecommendDetail{
  @StorageProp(ImmersionEnum.APP_BOTTOM_HEIGHT)
  bottomHeight:number = 0

  recommendCardData:CardClass[]=[
    {
      icon:$r("sys.symbol.calendar"),
      img:$r("app.media.advert_test_background"),
      description:"符合你口味的新鲜好歌",
      title:"每日推荐"
    },
    {
      icon:$r("sys.symbol.paperplane_right_fill"),
      img:$r("app.media.advert_test_background"),
      description:"多种听歌模式随心播放",
      title:"私人漫游"
    },
    {
      img:$r("app.media.advert_test_background"),
      description:"想了想该说什么 但好像只剩句号",
      title:"新歌首发"
    },
    {
      icon:$r("sys.symbol.heart_fill"),
      img:$r("app.media.advert_test_background"),
      description:"红心歌曲和相似推荐",
      title:"心动模式"
    },
    {
      img:$r("app.media.advert_test_background"),
      description:"正在热播欧美好音乐",
      title:"欧美专区"
    },
    {
      img:$r("app.media.advert_test_background"),
      description:"你爱的歌值得反复聆听",
      title:"私人雷达"
    }
  ]
  playListCardData:CardClass[]=[
    {
      img:$r("app.media.advert_test_background"),
      description:"华语流行|90/00后青春回忆杀",
    },
    {
      img:$r("app.media.advert_test_background"),
      description:"神仙打架的华语歌坛的那些年，经典永不过时",
    },
    {
      img:$r("app.media.advert_test_background"),
      description:"好听到爆炸的英文歌单！！！好歌",
    },
    {
      img:$r("app.media.advert_test_background"),
      description:"经典老歌|90后回忆杀 藏在老歌里的故事",
    },
    {
      img:$r("app.media.advert_test_background"),
      description:"华语R&B|百听不厌的节奏布鲁斯",
    },
    {
      img:$r("app.media.advert_test_background"),
      description:"格莱美历年最受欢迎冠军封神热单 欧美控",
    }
  ]
  adImagesList:ResourceStr[] = [
    "https://wangyimusic-oss.oss-cn-beijing.aliyuncs.com/advert/adImg01.jpg?Expires=1746364019&OSSAccessKeyId=TMP.3Ks4Hp66D1TC6beRfcYgsyDVkWH2ipjcHVV9T1Sg6K1mmppxaybnNc9ZbazP93ABUcAf9w7f2jC9Sxxc9CWWyJbSgNEbaq&Signature=H8J98Q4crynpHKSLaBD2I46%2Fv5w%3D",
    "https://wangyimusic-oss.oss-cn-beijing.aliyuncs.com/advert/adImg02.jpg?Expires=1746363898&OSSAccessKeyId=TMP.3Ks4Hp66D1TC6beRfcYgsyDVkWH2ipjcHVV9T1Sg6K1mmppxaybnNc9ZbazP93ABUcAf9w7f2jC9Sxxc9CWWyJbSgNEbaq&Signature=ck0Ldz9pM48ufULMVgEehFvytSk%3D",
    "https://wangyimusic-oss.oss-cn-beijing.aliyuncs.com/advert/adImg03.jpg?Expires=1746363914&OSSAccessKeyId=TMP.3Ks4Hp66D1TC6beRfcYgsyDVkWH2ipjcHVV9T1Sg6K1mmppxaybnNc9ZbazP93ABUcAf9w7f2jC9Sxxc9CWWyJbSgNEbaq&Signature=u%2FeXfqneB9GsPQM3fyX8Z4cvzVc%3D",
    "https://wangyimusic-oss.oss-cn-beijing.aliyuncs.com/advert/adImg04.jpg?Expires=1746363925&OSSAccessKeyId=TMP.3Ks4Hp66D1TC6beRfcYgsyDVkWH2ipjcHVV9T1Sg6K1mmppxaybnNc9ZbazP93ABUcAf9w7f2jC9Sxxc9CWWyJbSgNEbaq&Signature=Wc8mlXDzkq1GniRLVbZNWL6EEj4%3D",
    "https://wangyimusic-oss.oss-cn-beijing.aliyuncs.com/advert/adImg05.jpg?Expires=1746363932&OSSAccessKeyId=TMP.3Ks4Hp66D1TC6beRfcYgsyDVkWH2ipjcHVV9T1Sg6K1mmppxaybnNc9ZbazP93ABUcAf9w7f2jC9Sxxc9CWWyJbSgNEbaq&Signature=0C6Pmb0SiWzkTc07IxUI%2BvpYHSA%3D"
  ]
  songGoodList:SongCardClass[] = [
    {
      img:$r("app.media.advert_test_background"),
      songName:"What Does It Mean to You(Remix By Binary)",
      songArtist:"Jake Miller",
      songTags: ["十万红心","1w+评论"],
      isVip:true
    },
    {
      img:$r("app.media.advert_test_background"),
      songName:"What Does It Mean to You(Remix By Binary)",
      songArtist:"Jake Miller",
      songTags: ["十万红心","1w+评论"],
      isVip:true
    },
    {
      img:$r("app.media.advert_test_background"),
      songName:"What Does It Mean to You(Remix By Binary)",
      songArtist:"Jake Miller",
      songTags: ["十万红心","1w+评论"],
      isVip:true
    },
    {
      img:$r("app.media.advert_test_background"),
      songName:"What Does It Mean to You(Remix By Binary)",
      songArtist:"Jake Miller",
      songTags: ["十万红心","1w+评论"],
      isVip:true
    },
    {
      img:$r("app.media.advert_test_background"),
      songName:"What Does It Mean to You(Remix By Binary)",
      songArtist:"Jake Miller",
      songTags: ["十万红心","1w+评论"],
      isVip:true
    },
    {
      img:$r("app.media.advert_test_background"),
      songName:"What Does It Mean to You(Remix By Binary)",
      songArtist:"Jake Miller",
      songTags: ["十万红心","1w+评论"],
      isVip:true
    },
    {
      img:$r("app.media.advert_test_background"),
      songName:"What Does It Mean to You(Remix By Binary)",
      songArtist:"Jake Miller",
      songTags: ["十万红心","1w+评论"],
      isVip:true
    },
    {
      img:$r("app.media.advert_test_background"),
      songName:"What Does It Mean to You(Remix By Binary)",
      songArtist:"Jake Miller",
      songTags: ["十万红心","1w+评论"],
      isVip:true
    },
    {
      img:$r("app.media.advert_test_background"),
      songName:"What Does It Mean to You(Remix By Binary)",
      songArtist:"Jake Miller",
      songTags: ["十万红心","1w+评论"],
      isVip:true
    },
  ]
  songLoveList:SongCardClass[] = [
    {
      img:$r("app.media.advert_test_background"),
      songName:"What Does It Mean to You(Remix By Binary)",
      songArtist:"Jake Miller",
      songTags: ["十万红心","1w+评论"],
      isVip:true
    },
    {
      img:$r("app.media.advert_test_background"),
      songName:"What Does It Mean to You(Remix By Binary)",
      songArtist:"Jake Miller",
      songTags: ["十万红心","1w+评论"],
      isVip:true
    },
    {
      img:$r("app.media.advert_test_background"),
      songName:"What Does It Mean to You(Remix By Binary)",
      songArtist:"Jake Miller",
      songTags: ["十万红心","1w+评论"],
      isVip:true
    },
    {
      img:$r("app.media.advert_test_background"),
      songName:"What Does It Mean to You(Remix By Binary)",
      songArtist:"Jake Miller",
      songTags: ["十万红心","1w+评论"],
      isVip:true
    },
    {
      img:$r("app.media.advert_test_background"),
      songName:"What Does It Mean to You(Remix By Binary)",
      songArtist:"Jake Miller",
      songTags: ["十万红心","1w+评论"],
      isVip:true
    },
    {
      img:$r("app.media.advert_test_background"),
      songName:"What Does It Mean to You(Remix By Binary)",
      songArtist:"Jake Miller",
      songTags: ["十万红心","1w+评论"],
      isVip:true
    },
    {
      img:$r("app.media.advert_test_background"),
      songName:"What Does It Mean to You(Remix By Binary)",
      songArtist:"Jake Miller",
      songTags: ["十万红心","1w+评论"],
      isVip:true
    },
    {
      img:$r("app.media.advert_test_background"),
      songName:"What Does It Mean to You(Remix By Binary)",
      songArtist:"Jake Miller",
      songTags: ["十万红心","1w+评论"],
      isVip:true
    },
    {
      img:$r("app.media.advert_test_background"),
      songName:"What Does It Mean to You(Remix By Binary)",
      songArtist:"Jake Miller",
      songTags: ["十万红心","1w+评论"],
      isVip:true
    },
  ]

  build() {
    Scroll(){
      Column(){
        //推荐卡片组
        Scroll(){

          Grid(){
            ForEach(this.recommendCardData,(item:CardClass,index:number)=>{
              GridItem(){
                RecommendCard({
                  cardInfo:item,
                  isShowPlayButton:item.icon?true:false
                })
                  .width(140)
                  .height(200)
              }
            })
          }
          .width("100%")
          .rowsTemplate('1fr')
          .columnsGap(10)
          .scrollBar(BarState.Off)
          .height(210)
        }
        //推荐导航
        TitleNav({
          title:"推荐歌单",
          isShowIcon:true
        })
        //歌单卡片组
        Scroll(){
          Grid(){
            ForEach(this.playListCardData,(item:CardClass,index:number)=>{
              GridItem(){
                RecommendCard({
                  cardInfo:item,
                  isShowPlayButton:true,
                  bottomColor:$r("app.color.background_color_white"),
                  bottomTextColor:$r("app.color.text_color_black")
                })
                  .width(100)
                  .height(140)
              }
            })
          }
          .width("100%")
          .rowsTemplate('1fr')
          .columnsGap(10)
          .scrollBar(BarState.Off)
          .height(150)
        }
        //广告导航
        TitleNav({
          title:"一起领《我的世界》模组和钻石",
          isShowIcon:false
        })
        //广告组
        Swiper(){
          ForEach(this.adImagesList,(item:ResourceStr)=>{
            Image(item)
              .width("100%")
              .height("100%")
              .objectFit(ImageFit.Cover)
          })
        }
        .width("100%")
        .height(150)
        .padding(10)
        .autoPlay(true)
        //猜你喜欢导航
        TitleNav({
          title:"猜你喜欢的【欧美好歌】",
          isShowIcon:false
        })
        //猜你喜欢好歌组
        Scroll(){
          Grid(){
            ForEach(this.songGoodList,(item:SongCardClass,index:number)=>{
              GridItem(){
                songCard({
                  songInfo:item
                })
              }
            })
          }
          .width("100%")
          .rowsTemplate('1fr 1fr 1fr')
          .columnsGap(10)
          .rowsGap(10)
          .scrollBar(BarState.Off)
          .height(180)
          .padding(10)
        }
        //猜你喜欢导航
        TitleNav({
          title:"根据你喜爱的音乐推荐",
          isShowIcon:false
        })
        Scroll(){
          Grid(){
            ForEach(this.songLoveList,(item:SongCardClass,index:number)=>{
              GridItem(){
                songCard({
                  songInfo:item
                })
              }
            })
          }
          .width("100%")
          .rowsTemplate('1fr 1fr 1fr')
          .columnsGap(10)
          .rowsGap(10)
          .scrollBar(BarState.Off)
          .height(180)
          .padding(10)
        }
      }
      .width("100%")
      .alignSelf(ItemAlign.Start)
    }
    .width("100%")
    .height("100%")
    .scrollBar(BarState.Off)
    .padding({bottom:this.bottomHeight})
  }
}