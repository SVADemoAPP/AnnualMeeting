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
     * @Fields model : 中奖用户信息 
     */ 
    private AccountModel model;
    
    /** 
     * @Fields url : 跳转链接url
     */ 
    private String urlLink;
    
    /** 
     * @Fields urlImage : 推送图片 
     */ 
    private String urlImage;
    
    /** 
     * @Fields message : 推送消息 
     */ 
    private String message;
    
    /**
     * @param model the model to set
     */
    public void setModel(AccountModel model)
    {
        this.model = model;
    }

    /**
     * @param urlLink the urlLink to set
     */
    public void setUrlLink(String urlLink)
    {
        this.urlLink = urlLink;
    }

    /**
     * @param urlImage the urlImage to set
     */
    public void setUrlImage(String urlImage)
    {
        this.urlImage = urlImage;
    }

    /**
     * @param message the message to set
     */
    public void setMessage(String message)
    {
        this.message = message;
    }

    // 恭喜您中奖了，请在规定时间内取领奖页面确认"http://"+url+"/sva/weixin/mine?openid="+model.getOpenid()
    // 恭喜您中了"+prize.getName()+"!","http://"+url+"/sva/images/prize_"+code+".png"
    public void run()
    {
        if(!StringUtils.isEmpty(model.getOpenid())){
            try
            {
                Thread.sleep(23000);
            }
            catch (InterruptedException e)
            {
                e.printStackTrace();
            }
            WeixinUtil.pushNews(
                    model.getOpenid(), 
                    "中奖信息", 
                    message, 
                    urlLink, 
                    urlImage
            );
        }
    }
}
