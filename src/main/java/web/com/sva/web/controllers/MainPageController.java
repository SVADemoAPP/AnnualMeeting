/**   
 * @Title: MainPageController.java 
 * @Package com.sva.web.controllers 
 * @Description: web主页Controller 
 * @author labelCS   
 * @date 2018年1月19日 下午2:34:56 
 * @version V1.0   
 */
package com.sva.web.controllers;

import java.util.HashMap;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import com.sva.service.LotteryService;

/** 
 * @ClassName: MainPageController 
 * @Description: web主页Controller
 * @author labelCS 
 * @date 2018年1月19日 下午2:34:56 
 *  
 */
@Controller
@RequestMapping(value="/mainPage")
public class MainPageController
{
    @Autowired
    private LotteryService service;
    /** 
     * @Title: getPrizeDetail 
     * @Description: 获取所有的奖品信息
     * @return 
     */
    @RequestMapping(value="/getPrizeDetail", method = {RequestMethod.POST})
    @ResponseBody
    public Map<String, Object> getPrizeDetail(){
        Map<String, Object> model = new HashMap<String, Object>();
        model.put("returnCode", 1);
        model.put("data", service.getAllPrizeDetail());
        return model;
    }
    
    /** 
     * @Title: getRecord 
     * @Description: 获取中奖记录 
     * @return 
     */
    @RequestMapping(value="/getRecord", method = {RequestMethod.POST})
    @ResponseBody
    public Map<String, Object> getRecord(){
        Map<String, Object> model = new HashMap<String, Object>();
        model.put("returnCode", 1);
        model.put("data", service.getAllWinRecord());
        return model;
    }
}
