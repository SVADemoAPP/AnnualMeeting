package com.sva.web.controllers;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * <p>Title:HomeController</p>
 * <p>Description:页面菜单跳转controller</p>
 * <p>Company: ICS</p>
 * @author label
 * @date 2016年6月30日 下午2:59:26
 */
@Controller
@RequestMapping(value = "/home")
public class HomeController
{

    private static final Logger LOG = Logger.getLogger(HomeController.class);

    /** 
     * @Title: showSvaMng 
     * @Description: 抽奖起始页
     * @param model
     * @return 
     */
    @RequestMapping(value = "/showMain", method = {RequestMethod.GET})
    public String showMain()
    {
        return "web/main";
    }
    
    /** 
     * @Title: showLottery 
     * @Description: 抽奖页面
     * @return 
     */
    @RequestMapping(value = "/showLottery/{prizeCode}", method = {RequestMethod.GET})
    public String showLottery(@PathVariable("prizeCode")String prizeCode, Model model){
        model.addAttribute("prizeCode", prizeCode);
        return "web/lottery";
    }
    

    /** 
     * @Title: handleException 
     * @Description: 未知异常处理
     * @param ex
     * @return 
     */
    @ExceptionHandler(RuntimeException.class)
    public String handleException(RuntimeException ex, Model model)
    {
        String info = "未知错误: " + ex.getMessage();
        model.addAttribute("info", info);
        return "error";
    }
}
