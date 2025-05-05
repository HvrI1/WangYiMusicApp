export interface User {
  //没有密码和加密token

  id: number;
  /**
   * 用户名（非空，最大长度50）
   * @rule 非空校验逻辑需在业务层实现
   */
  username: string;
  /**
   * 密码（非空）
   * @rule 非空校验逻辑需在业务层实现
   */
  nick: string;
  /** 出生日期 */
  birthdate?: string; // 日期建议使用 ISO 格式字符串，如 "2023-10-05"
  /** 是否是VIP（0-否 1-是） */
  isVip: number;
  /** 标签列表（JSON数组字符串存储） */
  tags: string[];
  /** 个性签名（最大长度140） */
  signature?: string;
  /** 状态（0-冻结 1-正常 2-注销） */
  status: number;
  /** 邮箱（格式校验） */
  email?: string;
  /** 电话号码（最大长度20） */
  phone?: string;
  /** 地区编码（最大长度10） */
  regionCode?: string;
  /** 最后登录IP */
  lastLoginIp?: string;
  /** 最后登录时间（格式：yyyy-MM-dd HH:mm:ss） */
  lastLoginTime?: string;
  /** 创建时间（格式：yyyy-MM-dd HH:mm:ss） */
  createTime?: string;
  /** 更新时间（格式：yyyy-MM-dd HH:mm:ss） */
  updateTime?: string;
}
