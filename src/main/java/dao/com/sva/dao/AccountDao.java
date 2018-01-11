/**   
 * @Title: AccountDao.java 
 * @Package com.sva.dao 
 * @Description: 账户DAO
 * @author labelCS   
 * @date 2018年1月11日 下午3:47:22 
 * @version V1.0   
 */
package com.sva.dao;

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
}
