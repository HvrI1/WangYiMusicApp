import { UserDto } from "../pojo"
import { RequestAxios } from "../utils"

export const  loginApi = (userDto:UserDto)=>{
  return RequestAxios.post<string>("/user/login",userDto)
}