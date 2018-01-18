/**   
 * @Title: WinningRecordModel.java 
 * @Package com.sva.model 
 * @Description: 中奖信息model 
 * @author labelCS   
 * @date 2018年1月18日 下午3:43:53 
 * @version V1.0   
 */
package com.sva.model;

import java.util.Date;

/** 
 * @ClassName: WinningRecordModel 
 * @Description: 中奖信息model  
 * @author labelCS 
 * @date 2018年1月18日 下午3:43:53 
 *  
 */
public class WinningRecordModel
{
    /** 
     * @Fields id : 数据库id 
     */ 
    private int id;
    
    /** 
     * @Fields accountId : 获奖账户 
     */ 
    private int accountId;
    
    /** 
     * @Fields prizeCode : 奖品代码 
     */ 
    private int prizeCode;
    
    /** 
     * @Fields received : 是否领取(0:未领取;1:领取) 
     */ 
    private int received;
    
    /** 
     * @Fields time : 领取时间 
     */ 
    private Date time;

    /**
     * @return the id
     */
    public int getId()
    {
        return id;
    }

    /**
     * @param id the id to set
     */
    public void setId(int id)
    {
        this.id = id;
    }

    /**
     * @return the accountId
     */
    public int getAccountId()
    {
        return accountId;
    }

    /**
     * @param accountId the accountId to set
     */
    public void setAccountId(int accountId)
    {
        this.accountId = accountId;
    }

    /**
     * @return the prizeCode
     */
    public int getPrizeCode()
    {
        return prizeCode;
    }

    /**
     * @param prizeCode the prizeCode to set
     */
    public void setPrizeCode(int prizeCode)
    {
        this.prizeCode = prizeCode;
    }

    /**
     * @return the received
     */
    public int getReceived()
    {
        return received;
    }

    /**
     * @param received the received to set
     */
    public void setReceived(int received)
    {
        this.received = received;
    }

    /**
     * @return the time
     */
    public Date getTime()
    {
        return time;
    }

    /**
     * @param time the time to set
     */
    public void setTime(Date time)
    {
        this.time = time;
    }
}
