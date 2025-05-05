export interface AdvertInfo{
  id: number | null,
  advertName: string,//广告的名字
  advertUrl: string,//广告的资源地址
  linkUrl: string| null,
  type: number| null,
  position: string| null,
  duration: number,//广告的时长
  startTime: Date| null,
  endTime: Date| null,
  sortOrder: number| null,
  isOn: number| null,//是否需要开启广告
  clickCount: number| null,
  createTime: Date| null,
  updateTime: Date| null
}

