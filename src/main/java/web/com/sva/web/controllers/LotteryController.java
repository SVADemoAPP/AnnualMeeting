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
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

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
    @RequestMapping(value = "/getNumber")
    public Map<String, Object> getNumber(){
        Map<String, Object> result = new HashMap<String, Object>();
        // TODO 具体中奖逻辑
        result.put("data", "379591");
        
        return result;
    }
}
