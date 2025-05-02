import { AdvertInfo } from "../pojo"
import {  RequestAxios } from "../utils"

export const queryAllAdvert = () =>{
   return RequestAxios.get<AdvertInfo>("/advert/findAllAdvert")
}

export const queryAdvertById =async  (id:number) =>{
   return RequestAxios.get<AdvertInfo>(`/advert/findAdvertById?id=${id}`)
}