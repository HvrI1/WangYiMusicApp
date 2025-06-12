import { preferences } from "@kit.ArkData"
import { AppSettingEnum, USER_INFO } from "../constans"
import { User } from "../pojo/user"


export class UserSettingClass{
  private  context:Context

  constructor(context:Context) {
    this.context=context
  }

  //获取首选项仓库
  private getStore():Promise<preferences.Preferences>{
    return preferences.getPreferences(this.context,AppSettingEnum.APP_SETTING)
  }



  // //广告的数据存取
  // async setUserAd(ad:AdvertClass):Promise<void>{
  //   const store = await this.getStore()
  //   await store.put(USER_SETTING_AD,JSON.stringify(ad))
  //   await store.flush()
  // }
  //
  // async getUserAd():Promise<AdvertClass>{
  //   const store = await this.getStore()
  //   const result =  await store.get(USER_SETTING_AD,JSON.stringify(defaultAd))
  //   return JSON.parse(result as string) as AdvertClass
  // }
  //
  //用户的令牌和账号存入
  async setUserInfo(user:User):Promise<void>{
    const store = await this.getStore()
    await store.put(USER_INFO,user)
    await store.flush()
  }

  async getUserInfo():Promise<User>{
    const store = await this.getStore()
    const result =  await store.get(USER_INFO,"")
    return result as User
  }



}
