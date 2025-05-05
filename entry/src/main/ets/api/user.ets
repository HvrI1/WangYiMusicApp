import { Result } from "../commons/type_common"
import { User, UserDto } from "../pojo"
import { RequestAxios } from "../utils"

export const  loginApi = (userDto:UserDto)=>{
  return RequestAxios.post<Result>("/user/login",userDto)
}


export const  registerApi = (user:User)=>{
  return RequestAxios.post<Result>("/user/register",user)
}