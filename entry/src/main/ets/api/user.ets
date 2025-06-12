import { Result } from "../commons/type_common"
import { CheckTokenDto, User, UserDto } from "../pojo"
import { RequestAxios } from "../utils"

//登录请求
export const  loginApi = (userDto:UserDto)=>{
  return RequestAxios.post<Result>("/user/login",userDto)
}

//注册请求
export const  registerApi = (user:User)=>{
  return RequestAxios.post<Result>("/user/register",user)
}

//检查token是否过期
export const  checkTokenApi = (checkTokenDto:CheckTokenDto)=>{
  return RequestAxios.post<Result>("/user/checkToken",checkTokenDto)
}

//检查token是否过期
export const  selectUserInfoByUserNameApi = (username:string)=>{
  return RequestAxios.get<Result>(`/user/selectUserInfo?username=${username}`)
}