/**   
 * @Title: AccountDao.java 
 * @Package com.sva.dao 
 * @Description: 账户DAO
 * @author labelCS   
 * @date 2018年1月11日 下午3:47:22 
 * @version V1.0   
 */
package com.sva.dao;

import java.util.Date;
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
public interface WeixinDao {
    public AccountModel getAccountByOpenid(@Param("openid") String openid);

    public Integer login(AccountModel accountModel);

    public void logout(String openid);

    public List<FuModel> getFuList();

    public Integer changeOneFu(@Param("id") int id, @Param("one") int one);

    public Integer userGetOneFu(@Param("columnName") String columnName, @Param("openid") String openid,
            @Param("nextRandomTime") Date nextRandomTime);

    public AccountModel getUserInfo(String openid);

    public AccountModel getUserFus(String openid);

    public Integer compoundOneFu(String openid);

    public AccountModel getAccountByUsername(@Param("username") String username);

    public Integer giveOneFu(@Param("username") String username, @Param("openid") String openid,
            @Param("columnName") String columnName);

    public Integer acceptOneFu(@Param("username") String username, @Param("columnName") String columnName);
    
    public AccountModel getUserFusByUsername(String username);

    public Integer compoundOneFuByUsername(String username);
    
    public Integer changePassword( @Param("openid")String openid,@Param("oldPwd")String oldPwd,@Param("newPwd")String newPwd);
}
