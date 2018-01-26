/**   
 * @Title: StatisticService.java 
 * @Package com.sva.service 
 * @Description: 用户在线统计Service 
 * @author labelCS   
 * @date 2018年1月25日 下午5:29:15 
 * @version V1.0   
 */
package com.sva.service;

import java.util.Date;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import com.sva.dao.AccountDao;
import com.sva.model.AccountModel;

/** 
 * @ClassName: StatisticService 
 * @Description: 用户在线统计Service
 * @author labelCS 
 * @date 2018年1月25日 下午5:29:15 
 *  
 */
public class StatisticService
{
    @Autowired
    private AccountDao dao;
    
    @Value("${heartbeat.time}")
    private int time;
    
    @Value("${online.length}")
    private int length;
    
    /** 
     * @Title: refreshOnline 
     * @Description: 更新在线时长 
     * @param id 
     */
    public void refreshOnline(String id){
        // 获取该用户上一次心跳时间
        AccountModel am = dao.getPersionByUsername(id);
        // 判断心跳持续时间
        long lastTime = am.getLastHeartbeat().getTime();
        long curTime = new Date().getTime();
        long offset = curTime - lastTime;
        if(offset < time){
            am.setOnLineTime(am.getOnLineTime()+(int)offset);
        }
        am.setLastHeartbeat(new Date());
        // 更新数据库
        dao.updateOnlineTime(am);
    }
    
    /** 
     * @Title: getOnlineInfo 
     * @Description: 获取在线信息 
     * @param length
     * @return 
     */
    public List<AccountModel> getOnlineInfo(){
        return dao.getOnlineInfo(length);
    }
}
