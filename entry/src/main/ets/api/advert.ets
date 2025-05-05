import { Result } from "../commons/type_common"
import { AdvertInfo } from "../pojo"
import {  RequestAxios } from "../utils"

export const queryAllAdvert = () =>{
   return RequestAxios.get<Result>("/advert/findAllAdvert")
}

export const queryAdvertById =async  (id:number) =>{
   return RequestAxios.get<Result>(`/advert/findAdvertById?id=${id}`)
}