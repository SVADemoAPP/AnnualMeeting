/**   
 * @Title: SystemService.java 
 * @Package com.sva.service 
 * @Description: 系统服务  
 * @author labelCS   
 * @date 2018年1月29日 上午10:52:21 
 * @version V1.0   
 */
package com.sva.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import com.sva.dao.AccountDao;
import com.sva.dao.WinningRecordDao;

/** 
 * @ClassName: SystemService 
 * @Description: 系统服务 
 * @author labelCS 
 * @date 2018年1月29日 上午10:52:21 
 *  
 */
@Service
public class SystemService
{
    /** 
     * @Fields daoAccount : 账户dao 
     */ 
    @Autowired
    private AccountDao daoAccount;
    
    /** 
     * @Fields daoRecord : 获奖记录dao
     */ 
    @Autowired
    private WinningRecordDao daoRecord;
    
    @Value("${rate.initRate}")
    private String initRate;
    
    public void refresh(){
        // 员工在线时长归零
        daoAccount.refreshAccount();
        // 部门获奖概率恢复初始值
        String[] initRateArry = initRate.split(",");
        for(int i = 0; i < initRateArry.length; i++){
        	daoRecord.refreshDeptRate((i + 1) + "",Integer.parseInt(initRateArry[i]));
        }
        // 员工获奖记录清空
        daoRecord.refreshRecord();
    }
}
