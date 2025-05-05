import { BacKNav } from '../../components';
import { User, UserModel } from '../../pojo';
import { router } from '@kit.ArkUI';
import { loginApi } from '../../api';
import { UserSettingClass } from '../../utils';
import { UserInfo } from '../../constans';
import { RegisterDialog } from './RegisterDialog/RegisterDialog';
import { Result } from '../../commons/type_common';

@Entry
@Component
struct Login {
  //状态：user对象
  @State
  user:User = new UserModel({} as User)

  //状态：是否在加载中
  @State
  loading:boolean = false

  //注册弹窗
  private controller:CustomDialogController = new CustomDialogController({
    builder:RegisterDialog({
      registerDataCallBack:(user:User)=>{
        this.user = user
        console.log(JSON.stringify(user));
      }
    }),
    autoCancel:false
  })

  //登录
  async login(){
    //锁定登录
    this.loading = true
    //登录操作
    let res:Result =  await loginApi({username:this.user.username,password:this.user.password})
    //存入AppStorage
    AppStorage.setOrCreate(UserInfo.USER_TOKEN_KEY,res.data)
    //存入首选项
    new UserSettingClass(getContext()).setUserToken(res.data as string)
    // //解除锁定
    this.loading = false
    // //跳转首页
    router.replaceUrl({url:"pages/Index/Index"})
  }

  //注册
   async register(){
      this.controller.open()
   }

  build() {
    Column(){
      BacKNav()
      Column({space:10}){
        TextInput({placeholder:"账号",text:$$this.user.username})
          .width("60%")
          .height(40)
          .enabled(!this.loading)
          .onChange((v)=>{
            this.user.username = v
          })

        TextInput({placeholder:"密码",text:$$this.user.password})
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

        Row({space:20}){
          Text("注册")
            .margin({top:10})
            .fontSize($r("app.float.page_text_font_size"))
            .fontColor($r("app.color.text_color_black"))
            .onClick(()=>{
              //TODO:注册
              this.register()
            })
          Text("重设密码")
            .margin({top:10})
            .fontSize($r("app.float.page_text_font_size"))
            .fontColor($r("app.color.text_color_black"))
            .onClick(()=>{
              //TODO:修改密码
            })
        }

      }
      .width('100%')
      .layoutWeight(1)

    }
    .height('100%')
    .width('100%')
  }
}