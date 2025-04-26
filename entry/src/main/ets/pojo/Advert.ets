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