import { BacKNav } from '../../components';
import { User, UserModel } from '../../pojo';
import { router } from '@kit.ArkUI';
import { loginApi } from '../../api';
import { UserSettingClass } from '../../utils';
import { UserInfo } from '../../constans';

@Entry
@Component
struct Login {
  //状态：user对象
  @State
  user:User = new UserModel({} as User)

  //状态：是否在加载中
  @State
  loading:boolean = false

  async login(){
    //锁定登录
    this.loading = true
    //登录操作
    let res =  await loginApi({username:this.user.username,password:this.user.password})
    //存入AppStorage
    AppStorage.setOrCreate(UserInfo.USER_TOKEN_KEY,res)
    //存入首选项
    new UserSettingClass(getContext()).setUserToken(res)
    // //解除锁定
    this.loading = false
    // //跳转首页
    router.replaceUrl({url:"pages/Index/Index"})
  }



  build() {
    Column(){
      BacKNav()
      Column({space:10}){
        TextInput({placeholder:"账号"})
          .width("60%")
          .height(40)
          .enabled(!this.loading)
          .onChange((v)=>{
            this.user.username = v
          })

        TextInput({placeholder:"密码"})
          .width("60%")
          .height(40)
          .enabled(!this.loading)
          .onChange((v)=>{
            this.user.password = v
          })

        Button("登录")
          .width("60%")
          .height(40)
          .margin({top:10})
          .backgroundColor($r("app.color.primary"))
          .enabled(!this.loading && this.user.username != undefined && this.user.password != undefined)
          .onClick(()=>{
            //登录
            this.login()
          })

        Text("重设密码")
          .margin({top:10})
          .fontSize($r("app.float.page_text_font_size"))
          .fontColor($r("app.color.text_color_black"))
          .onClick(()=>{
            //TODO:修改密码
          })
      }
      .width('100%')
      .layoutWeight(1)

    }
    .height('100%')
    .width('100%')
  }
}