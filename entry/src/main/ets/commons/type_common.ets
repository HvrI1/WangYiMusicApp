//tabs的类型约束
export class TabClass{
  title:string = ""
  name:string = ""
  icon?:ResourceStr
}

//卡片通用的类型约束
export class CardClass{
  icon?:ResourceStr
  title?:string //标题title
  description:string =""//描述description
  img:ResourceStr = ""//背景图片img
}

//歌曲卡片的类型约束
export class SongCardClass{
  img:ResourceStr = ""//图片
  songName:string = ""
  songArtist:string = ""
  songTags:string[] = []
  isVip:boolean = false
}

//统一响应类型
export  class  Result{
  code?:number
  message?:string
  data?:Object|null
}