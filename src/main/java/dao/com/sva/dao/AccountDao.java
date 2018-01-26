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

/** 
 * @ClassName: AccountDao 
 * @Description: 账户DAO
 * @author labelCS 
 * @date 2018年1月11日 下午3:47:22 
 *  
 */
public interface AccountDao
{
    /** 
     * @Title: getAccountByName 
     * @Description: 查询账户名对应的账户信息
     * @param username
     * @return 
     */
    public AccountModel getAccountByName(String username);
    
    /** 
     * @Title: getPersionById 
     * @Description: 根据id查找对应的账户信息
     * @param id
     * @return 
     */
    public AccountModel getPersionById(int id);
    
    /** 
     * @Title: getPersionByUsername 
     * @Description: 根据用户名查找对应的账户信息 
     * @param username
     * @return 
     */
    public AccountModel getPersionByUsername(String username);
    
    /** 
     * @Title: getCandidate 
     * @Description: 查找符合抽奖条件的候选人
     * @param dept
     * @param prizeCode
     * @return 
     */
    public List<Integer> getCandidate(@Param("dept")String dept, @Param("prizeCode")String prizeCode);
    
    /** 
     * @Title: updateOnlineTime 
     * @Description: 更新在线时长 
     * @param model 
     */
    public void updateOnlineTime(AccountModel model);
    
    /** 
     * @Title: getOnlineInfo 
     * @Description: 获取在线时长信息 
     * @return 
     */
    public List<AccountModel> getOnlineInfo(int length);
}
