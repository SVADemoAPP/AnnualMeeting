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

    public Integer updateHeart(@Param("username") String username,
            @Param("lastHeartbeat") Date lastHeartbeat);
    
    public Integer login(AccountModel accountModel);

    public void logout(String openid);

    public List<FuModel> getFuList();

    public Integer changeOneFu(@Param("id") int id, @Param("one") int one);

    public Integer userGetOneFu(@Param("columnName") String columnName, @Param("openid") String openid,
            @Param("nextRandomTime") Date nextRandomTime);
    
    public Date getNextRandomTime(String openid);

    public AccountModel getUserInfo(String openid);

    public AccountModel getUserFus(String openid);
    
    public Integer getCountByFuId(int fuId);
    
    public Integer reduceCountByFuId(@Param("fuId")int fuId,@Param("fuCount") int fuCount);
    
    public List<AccountModel> getRandomAccount(@Param("columnName") String columnName,@Param("fuCount") int fuCount);

    public Integer updateRandomAccount(@Param("columnName") String  columnName, @Param("list") List<String> list);
    
    public Integer compoundRandomAccount(@Param("list") List<String> list);
    
    public Integer compoundOneFu(String openid);

    public AccountModel getAccountByUsername(@Param("username") String username);

    public Integer giveOneFu(@Param("username") String username, @Param("openid") String openid,
            @Param("columnName") String columnName);

    public Integer acceptOneFu(@Param("username") String username, @Param("columnName") String columnName);
    
    public AccountModel getUserFusByUsername(String username);

    public Integer compoundOneFuByUsername(String username);
    
    public Integer changePassword( @Param("openid")String openid,@Param("oldPwd")String oldPwd,@Param("newPwd")String newPwd);
    
    /** 
     * @Title: getCollectedPeople 
     * @Description: 获取所有集齐福卡的人 
     * @return 
     */
    public List<AccountModel> getCollectedPeople();
    
    /** 
     * @Title: updateFuInfo 
     * @Description: 更新福卡的集齐状态 
     * @param id
     * @param flag 
     */
    public void updateFuInfo(@Param("id")String id, @Param("flag")int flag);
}
