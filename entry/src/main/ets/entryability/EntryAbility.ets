import { AbilityConstant, UIAbility, Want } from '@kit.AbilityKit';
import { App, window } from '@kit.ArkUI';
import { queryAdvertById } from '../api';
import { ImmersionEnum } from '../constans';

export default class EntryAbility extends UIAbility {
  onCreate(want: Want, launchParam: AbilityConstant.LaunchParam): void {
  }

  onWindowStageCreate(windowStage: window.WindowStage): void {
    setImmersion(windowStage)
    windowStage.loadContent("pages/Advert/Advert")
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