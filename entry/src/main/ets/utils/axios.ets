//【第三方axios】
import axios,{InternalAxiosRequestConfig,AxiosError,AxiosResponse,AxiosRequestConfig} from "@ohos/axios"

import { router } from "@kit.ArkUI"
import { RequestInfo, USER_INFO } from "../constans"
import { UserSettingClass } from "."
import { User } from "../pojo/user"

const instance = axios.create({
  baseURL:RequestInfo.BASE_URL,//自动组合到请求路径
  readTimeout:10000
})


//请求拦截配置，发起请求时，先执行这里追加令牌
instance.interceptors.request.use((config:InternalAxiosRequestConfig)=>{

  //config就是配置，我们在头部追加用户令牌
  let user:User = AppStorage.get(USER_INFO) as User
  let token:string
  if(user && user.accessToken){
    token =  user.accessToken
    config.headers.Authorization = token
    return config
  }
  return config
},(err:AxiosError)=>{
  return Promise.reject(err)
})


//响应拦截，接收到响应结果后，执行这里的操作
instance.interceptors.response.use((response:AxiosResponse)=>{

  //data:{code,meg,data}
  //判断结果：
  if(response.data && response.data.code ===0){
    return response.data
  }
  //TODO:如果response.data.code ===401等自行处理
  if(response.data && response.data.code ===1){
    console.error(JSON.stringify(response.data)+"后端接口调用失败")
    return response.data
  }
  //默认返回响应，调用者处理
  return response
},(err:AxiosError)=>{
  console.log(JSON.stringify(err))
  //是否是401，身份验证不通过
  if(err.response?.status===401){
    console.log(111+"");
    //说明令牌无效
    AppStorage.setOrCreate(USER_INFO,"")//删除应用中的token记录
    new UserSettingClass(getContext()).setUserInfo({} as User)//删除首选项中的token
    //跳转登录
    router.replaceUrl({ url: 'pages/Login/Login' })
  }

  return Promise.reject(err)
})


//提供执行操作对象，适配泛型
//R是返回类型，D是请求类型
//支持调用时，自定义配置
function request<R=null,D=null>(config:AxiosRequestConfig){
  //返回操作实例
  return instance<null,R,D>(config)
}


export class RequestAxios{
  static get<T>(url:string, data?:object):Promise<T> {
    return request<T,null>({url,params:data,method:"GET"})
  }

  static post<T>(url:string, data?:object):Promise<T> {

    return request<T,object>({url,data,method:"POST"})
  }

  static put<T>(url:string, data?:object):Promise<T> {
    return request<T,object>({url,data,method:"PUT"})
  }

  static delete<T>(url:string, data?:object):Promise<T> {
    return request<T,object>({url,data,method:"DELETE"})
  }
}
