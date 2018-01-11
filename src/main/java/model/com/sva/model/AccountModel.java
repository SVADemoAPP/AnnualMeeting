/**   
 * @Title: AccountModel.java 
 * @Package com.sva.model 
 * @Description: 账户信息model
 * @author labelCS   
 * @date 2018年1月11日 下午5:08:36 
 * @version V1.0   
 */
package com.sva.model;

/** 
 * @ClassName: AccountModel 
 * @Description: 账户信息model
 * @author labelCS 
 * @date 2018年1月11日 下午5:08:36 
 *  
 */
public class AccountModel
{
    /** 
     * @Fields username : 账户名
     */ 
    private String username;
    
    /** 
     * @Fields password : 账户密码
     */ 
    private String password;
    
    /** 
     * @Fields realname : 用户姓名
     */ 
    private String realname;
    
    /** 
     * @Fields lastLoginTime : 最近一次登录时间
     */ 
    private String lastLoginTime;
    
    /** 
     * @Fields loginState : 是否登录状态
     */ 
    private String loginState;
    
    /** 
     * @Fields id : 数据库id
     */ 
    private String id;
    
    /**
     * @return the username
     */
    public String getUsername()
    {
        return username;
    }
    /**
     * @param username the username to set
     */
    public void setUsername(String username)
    {
        this.username = username;
    }
    /**
     * @return the password
     */
    public String getPassword()
    {
        return password;
    }
    /**
     * @param password the password to set
     */
    public void setPassword(String password)
    {
        this.password = password;
    }
    /**
     * @return the realname
     */
    public String getRealname()
    {
        return realname;
    }
    /**
     * @param realname the realname to set
     */
    public void setRealname(String realname)
    {
        this.realname = realname;
    }
    /**
     * @return the lastLoginTime
     */
    public String getLastLoginTime()
    {
        return lastLoginTime;
    }
    /**
     * @param lastLoginTime the lastLoginTime to set
     */
    public void setLastLoginTime(String lastLoginTime)
    {
        this.lastLoginTime = lastLoginTime;
    }
    /**
     * @return the loginState
     */
    public String getLoginState()
    {
        return loginState;
    }
    /**
     * @param loginState the loginState to set
     */
    public void setLoginState(String loginState)
    {
        this.loginState = loginState;
    }
    /**
     * @return the id
     */
    public String getId()
    {
        return id;
    }
    /**
     * @param id the id to set
     */
    public void setId(String id)
    {
        this.id = id;
    }
    
}
