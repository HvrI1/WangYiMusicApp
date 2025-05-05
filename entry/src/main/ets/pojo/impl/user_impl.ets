import { User } from "../user";

export class  UserModel implements User{
  id: number;
  username: string;
  password: string;
  nick: string;
  birthdate?: string | undefined;
  isVip: number;
  tags: string[];
  signature?: string | undefined;
  status: number;
  email?: string | undefined;
  phone?: string | undefined;
  regionCode?: string | undefined;
  lastLoginIp?: string | undefined;
  lastLoginTime?: string | undefined;
  createTime?: string | undefined;
  updateTime?: string | undefined;

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
  }


}