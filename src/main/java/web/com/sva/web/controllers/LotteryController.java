/**   
 * @Title: LotteryController.java 
 * @Package com.sva.web.controllers 
 * @Description: 抽奖页面controller
 * @author labelCS   
 * @date 2018年1月15日 上午11:14:11 
 * @version V1.0   
 */
package com.sva.web.controllers;

import java.util.HashMap;
import java.util.Map;
import javax.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import com.sva.model.AccountModel;
import com.sva.service.LotteryService;
import com.sva.service.PushWeixin;
import com.sva.web.models.LotteryInputModel;
import com.sva.web.models.WinningInfoModel;
import com.sva.web.models.extension.WinningInfoExtension;

/** 
 * @ClassName: LotteryController 
 * @Description: 抽奖页面controller
 * @author labelCS 
 * @date 2018年1月15日 上午11:14:11 
 *  
 */
@Controller
@RequestMapping(value = "/lottery")
public class LotteryController
{
    @Autowired
    LotteryService service;
    
    /** 
     * @Fields serverUrl : 外网可以访问的服务器地址 
     */ 
    @Value("${server.url}")
    private String serverUrl;
    
    /** 
     * @Title: getNumber 
     * @Description: 抽取中奖员工 
     * @param model
     * @param result
     * @return 
     */
    @RequestMapping(value = "/getNumber", method = {RequestMethod.POST})
    @ResponseBody
    public Map<String, Object> getNumber(@Valid @RequestBody LotteryInputModel model, BindingResult result){
        Map<String, Object> modelMap = new HashMap<String, Object>();
        // 校验用户输入
        if(result.hasErrors()){
            modelMap.put("error", result.getAllErrors());
            return modelMap;
        }
        // 具体中奖逻辑
        AccountModel winner = service.getWinningEmployee(model.getPrizeCode());
        // 推送微信
        PushWeixin thread = new PushWeixin();
        thread.setCode(model.getPrizeCode());
        thread.setModel(winner);
        thread.setService(service);
        thread.setUrl(serverUrl);
        new Thread(thread).start();
        
        modelMap.put("returnCode", "1");
        modelMap.put("data", winner);
        
        return modelMap;
    }
    
    /** 
     * @Title: getPrizeCount 
     * @Description: 查看剩余数额 
     * @param model
     * @param result
     * @return 
     */
    @RequestMapping(value="/getPrizeCount", method = {RequestMethod.POST})
    @ResponseBody
    public Map<String, Object> getPrizeCount(@Valid @RequestBody LotteryInputModel model, BindingResult result){
        Map<String, Object> modelMap = new HashMap<String, Object>();
        // 校验用户输入
        if(result.hasErrors()){
            modelMap.put("error", result.getAllErrors());
            return modelMap;
        }
        // 查询奖品余额
        int r = service.getRemainPrizeCount(model.getPrizeCode());
        modelMap.put("returnCode", "1");
        modelMap.put("data", r);
        
        return modelMap;
    }
    
    /** 
     * @Title: saveWinningRecord 
     * @Description: 记录中奖信息 
     * @param model
     * @param result
     * @return 
     */
    @RequestMapping(value="/saveWinningRecord", method = {RequestMethod.POST})
    @ResponseBody
    public Map<String, Object> saveWinningRecord(@Valid @RequestBody WinningInfoModel model, BindingResult result){
        Map<String, Object> modelMap = new HashMap<String, Object>();
        // 校验用户输入
        if(result.hasErrors()){
            modelMap.put("error", result.getAllErrors());
            return modelMap;
        }
        service.saveWinningRecord(WinningInfoExtension.toWinningRecordModel(model));
        modelMap.put("returnCode", 1);
        return modelMap;
    }
}
