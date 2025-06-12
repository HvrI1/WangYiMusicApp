import { AbilityConstant, UIAbility, Want } from '@kit.AbilityKit';
import { App, promptAction, window } from '@kit.ArkUI';
import { checkTokenApi, queryAdvertById, selectUserInfoByUserNameApi } from '../api';
import { Result } from '../commons/type_common';
import { ImmersionEnum, USER_INFO } from '../constans';
import { User } from '../pojo';
import { UserSettingClass } from '../utils';
import { BusinessError } from '@kit.BasicServicesKit';
import { ErrorEvent } from '@kit.ArkTS';

export default class EntryAbility extends UIAbility {
  onCreate(want: Want, launchParam: AbilityConstant.LaunchParam): void {

  }

  onWindowStageCreate(windowStage: window.WindowStage): void {
    //获取窗口避让高度
    setImmersion(windowStage)

    //自动登录
    autoLogin(windowStage,this.context)
  }


}
//设置沉浸式的方法
function setImmersion(windowStage: window.WindowStage){
  //获取主窗口对象
  const mainWindow =  windowStage.getMainWindowSync()
  // 添加全屏设置
  // mainWindow.setWindowLayoutFullScreen(true) // 设置沉浸式开启
  // mainWindow.setWindowSystemBarEnable([]) // 隐藏所有系统栏
  //获得窗口避让区域的头部区域，并将结果转为vp,注意此处的window是导入的包
  const topHeight = px2vp(mainWindow.getWindowAvoidArea(window.AvoidAreaType.TYPE_SYSTEM).topRect.height)
  //获得底部区域，和上面同理,注意这里的AvoidAreaType枚举类型选择和上面不一样
  const bottomHeight = px2vp(mainWindow.getWindowAvoidArea(window.AvoidAreaType.TYPE_NAVIGATION_INDICATOR).bottomRect.height)
  //获得高度后，我们需要存入appStorage中
  AppStorage.setOrCreate(ImmersionEnum.APP_TOP_HEIGHT,topHeight)
  AppStorage.setOrCreate(ImmersionEnum.APP_BOTTOM_HEIGHT,bottomHeight)
}

const  autoLogin =async(windowStage: window.WindowStage,context:Context)=> {
  //调用首选项查询是否有token
  let user:User = await new UserSettingClass(context).getUserInfo()

  if(user.accessToken && user.username){
    AppStorage.setOrCreate(USER_INFO,user)
    //查询token是否过期
    const res_checkTokenApi =  await checkTokenApi({token:user.accessToken,username:user.username})
    console.log("调用接口查询token是否过期",JSON.stringify(res_checkTokenApi.message))
    if(res_checkTokenApi.message === "token未过期"){
      //未过期
      //查询用户所有信息
      const res_user:Result =  await selectUserInfoByUserNameApi(user.username)
      console.log("调用接口查询用户所有信息",JSON.stringify(res_user.data))
      AppStorage.setOrCreate(USER_INFO,res_user.data as User)
      //判断有无vip
      if((res_user.data as User).isVip && (res_user.data as User).isVip ===1){
        //有vip
        windowStage.loadContent("pages/Index/Index")
      }else {
        //无vip
        windowStage.loadContent("pages/Advert/Advert")
      }
    }else {
      //过期直接去广告
      promptAction.showToast({message:"token已过期,需要重新登录"})
      AppStorage.setOrCreate(USER_INFO,null)
      windowStage.loadContent("pages/Login/Login")
    }

  }else {
    //token或username不存在
    AppStorage.setOrCreate(USER_INFO,null)
    windowStage.loadContent("pages/Login/Login")
  }


}