/**   
 * @Title: AccountDao.java 
 * @Package com.sva.dao 
 * @Description: 账户DAO
 * @author labelCS   
 * @date 2018年1月11日 下午3:47:22 
 * @version V1.0   
 */
package com.sva.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.sva.model.AccountModel;
import com.sva.model.FuModel;

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
    
    public void logout(String openid);
    
    public List<FuModel> getFuList();
    
    public Integer changeOneFu(@Param("id")int id,@Param("one")int one);
    
    public Integer  userGetOneFu(@Param("columnName")String columnName,@Param("openid")String openid);

    public AccountModel getUserFus(String openid);
    
    public AccountModel getUserInfo(String openid);
    
    public Integer compoundOneFu(String openid);
}
