import { AdvertInfo } from ".."

export class AdvertInfoModel implements AdvertInfo{
  id: number | null = null;
  advertName: string;
  advertUrl: string;
  linkUrl: string | null= null;
  type: number | null= null;
  position: string | null= null;
  duration: number;
  startTime: Date | null= null;
  endTime: Date | null= null;
  sortOrder: number | null= null;
  isOn: number | null= null;
  clickCount: number | null= null;
  createTime: Date | null= null;
  updateTime: Date | null= null;

  constructor(advertInfo:AdvertInfo) {
    this.id = advertInfo.id;
    this.advertName = advertInfo.advertName;
    this.advertUrl = advertInfo.advertUrl;
    this.linkUrl = advertInfo.linkUrl;
    this.type = advertInfo.type;
    this.position = advertInfo.position;
    this.duration = advertInfo.duration;
    this.startTime = advertInfo.startTime;
    this.endTime = advertInfo.endTime;
    this.sortOrder = advertInfo.sortOrder;
    this.isOn = advertInfo.isOn;
    this.clickCount = advertInfo.clickCount;
    this.createTime = advertInfo.createTime;
    this.updateTime = advertInfo.updateTime;
  }
}