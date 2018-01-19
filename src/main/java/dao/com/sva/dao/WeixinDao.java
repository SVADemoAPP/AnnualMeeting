/**   
 * @Title: AccountDao.java 
 * @Package com.sva.dao 
 * @Description: 账户DAO
 * @author labelCS   
 * @date 2018年1月11日 下午3:47:22 
 * @version V1.0   
 */
package com.sva.dao;

import org.apache.ibatis.annotations.Param;

import com.sva.model.AccountModel;

/**
 * 
 * @ClassName: WeixinDao 
 * @Description: 微信相关dao
 * @author gyr 
 * @date 2018年1月18日 上午9:54:05 
 *
 */
public interface WeixinDao
{
    public AccountModel getAccountIdByOpenid(@Param("openid") String openid);
    
    public Integer login(AccountModel accountModel);
}
