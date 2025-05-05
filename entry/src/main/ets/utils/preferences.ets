import { preferences } from "@kit.ArkData"
import { AppSettingEnum, UserInfo } from "../constans"


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
  //用户的令牌存取
  async setUserToken(token:string):Promise<void>{
    const store = await this.getStore()
    await store.put(UserInfo.USER_TOKEN_KEY,token)
    await store.flush()
  }

  async getUserToken():Promise<string>{
    const store = await this.getStore()
    const result =  await store.get(UserInfo.USER_TOKEN_KEY,"")
    return result as string
  }

}
