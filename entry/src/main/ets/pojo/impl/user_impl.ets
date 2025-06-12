import { User } from "../user";

export class  UserModel implements User{
  id: number;
  username: string
  password: string
  nick: string
  birthdate?: string
  isVip: number
  tags: string[]
  signature?: string
  status: number
  email?: string
  phone?: string
  accessToken?:string
  refreshToken?:string
  regionCode?: string
  lastLoginIp?: string
  lastLoginTime?: string
  createTime?: string
  updateTime?: string

  constructor(model:User) {
    this.id = model.id;
    this.username = model.username;
    this.password=model.password
    this.nick = model.nick;
    this.birthdate = model.birthdate;
    this.isVip = model.isVip;
    this.tags = model.tags;
    this.signature = model.signature;
    this.status = model.status;
    this.email = model.email;
    this.phone = model.phone;
    this.regionCode = model.regionCode;
    this.lastLoginIp = model.lastLoginIp;
    this.lastLoginTime = model.lastLoginTime;
    this.createTime = model.createTime;
    this.updateTime = model.updateTime;
    this.accessToken = model.accessToken;
    this.refreshToken = model.refreshToken;
  }


}