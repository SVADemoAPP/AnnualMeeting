/**   
 * @Title: PushWeixin.java 
 * @Package com.sva.service 
 * @Description: 推送微信线程 
 * @author labelCS   
 * @date 2018年1月24日 上午11:13:16 
 * @version V1.0   
 */
package com.sva.service;

import org.apache.commons.lang.StringUtils;
import com.sva.common.weixin.utils.WeixinUtil;
import com.sva.model.AccountModel;
import com.sva.model.PrizeModel;

/** 
 * @ClassName: PushWeixin 
 * @Description: 推送微信线程
 * @author labelCS 
 * @date 2018年1月24日 上午11:13:16 
 *  
 */
public class PushWeixin implements Runnable
{
    /** 
     * @Fields code : 奖品代码 
     */ 
    private String code;
    
    /** 
     * @Fields model : 中奖用户信息 
     */ 
    private AccountModel model;
    
    /** 
     * @Fields service : 抽奖服务
     */ 
    private LotteryService service;
    
    /** 
     * @Fields url : 服务器的url
     */ 
    private String url;
    
    /**
     * @param code the code to set
     */
    public void setCode(String code)
    {
        this.code = code;
    }
    
    /**
     * @param model the model to set
     */
    public void setModel(AccountModel model)
    {
        this.model = model;
    }
    
    /**
     * @param service the service to set
     */
    public void setService(LotteryService service)
    {
        this.service = service;
    }
    
    /**
     * @param url the url to set
     */
    public void setUrl(String url)
    {
        this.url = url;
    }

    public void run()
    {
        if(!StringUtils.isEmpty(model.getOpenid())){
            try
            {
                Thread.sleep(24000);
            }
            catch (InterruptedException e)
            {
                e.printStackTrace();
            }
            PrizeModel prize = service.getPrizeDetail(code);
            WeixinUtil.pushNews(
                    model.getOpenid(), 
                    "中奖信息", 
                    "恭喜您中奖了，您中了"+prize.getName()+"!奖品为"+prize.getDesc(), 
                    "http://"+url+"/sva/weixin/skipPrize?openid="+model.getOpenid(), 
                    "http://"+url+"/sva/images/prize_"+code+".png"
            );
        }
    }
}
