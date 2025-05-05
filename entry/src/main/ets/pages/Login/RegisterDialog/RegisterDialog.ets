import { registerApi } from "../../../api"
import { UserModel } from "../../../pojo/impl/user_impl"
import { User } from "../../../pojo/user"
import { promptAction } from "@kit.ArkUI"
import { Result } from "../../../commons/type_common"

@CustomDialog
@Component
export struct RegisterDialog {
  @State
  private user: UserModel = new UserModel({
    username:"",
    password:"",
    nick:""
  } as User)

  private controller: CustomDialogController

  //状态：是否在加载中
  @State loading:boolean = false

  registerDataCallBack = (user:User)=>{}

  async register(){
    //锁定按钮和组件
    this.loading = true
    //调用接口注册
    let res:Result = await registerApi(this.user)
    //将用户名和密码传回去
    this.registerDataCallBack(this.user)
    //解锁
    this.loading = false
    //关闭弹窗
    this.controller.close()
    promptAction.showToast({message:res.message})
  }

  build() {
    Column({ space: 10 }) {
      // 标题
      Text('用户注册')
        .fontSize(20)
        .fontColor($r('app.color.text_color_black'))
        .margin({ bottom: 20 })

      // 用户名
      TextInput({ placeholder: '用户名（必填）' })
        .width('80%')
        .height(40)
        .enabled(!this.loading)
        .onChange(v => {
          this.user.username = v
        })

      // 密码
      TextInput({ placeholder: '密码（必填）' })
        .width('80%')
        .height(40)
        .type(InputType.Password)
        .enabled(!this.loading)
        .onChange(v => {
          this.user.password = v
        })

      // 昵称
      TextInput({ placeholder: '昵称（必填）' })
        .width('80%')
        .height(40)
        .enabled(!this.loading)
        .onChange(v => {
          this.user.nick = v
        })

      // 可选字段
      TextInput({ placeholder: '邮箱（可选）' })
        .width('80%')
        .height(40)
        .enabled(!this.loading)
        .onChange(v => this.user.email = v)

      TextInput({ placeholder: '手机号（可选）' })
        .width('80%')
        .height(40)
        .enabled(!this.loading)
        .onChange(v => this.user.phone = v)

      // 按钮组
      Row({ space: 20 }) {
        Button('取消')
          .width(120)
          .height(40)
          .backgroundColor('#CCC')
          .onClick(() => this.controller.close())

        Button('注册')
          .width(120)
          .height(40)
          .backgroundColor($r('app.color.primary'))
          .enabled(!this.loading && this.user.username != "" && this.user.password != "" && this.user.nick != "")
          .onClick(() => {
            // 处理注册逻辑
            this.register()

          })
      }
      .margin({ top: 20 })
    }
    .padding(20)
    .width('100%')
  }
}