/**   
 * @Title: PushAdController.java 
 * @Package com.sva.web.controllers 
 * @Description: 广告推送Controller 
 * @author labelCS   
 * @date 2018年1月19日 下午2:34:56 
 * @version V1.0   
 */
package com.sva.web.controllers;

import java.io.File;
import java.io.UnsupportedEncodingException;
import java.sql.SQLException;
import java.util.Date;
import javax.servlet.http.HttpServletRequest;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import com.sva.common.ConvertUtil;
import com.sva.service.SystemService;

/** 
 * @ClassName: PushAdController 
 * @Description: 广告推送Controller
 * @author labelCS 
 * @date 2018年1月19日 下午2:34:56 
 *  
 */
@Controller
@RequestMapping(value="/pushAd")
public class PushAdController
{
    
    @Autowired
    private SystemService service;
    
    /** 
     * @Title: uploadAndPush 
     * @Description: 推送广告 
     * @param image
     * @param txt
     * @param request
     * @return
     * @throws SQLException 
     */
    @RequestMapping(value = "/uploadAndPush", method = {RequestMethod.POST})
    public String uploadAndPush(
            @RequestParam(value = "image", required = false) MultipartFile image,String txt,
            HttpServletRequest request, Model model) throws SQLException{
        String result = "";
        String fileName = "";
        if (image != null && StringUtils.isNotEmpty(image.getOriginalFilename())){
            fileName = image.getOriginalFilename();
            String path = request.getSession().getServletContext()
                    .getRealPath("/WEB-INF/upload/ad");
            String ext = fileName.substring(fileName.lastIndexOf('.'));
            fileName = "ad_" + ConvertUtil.dateFormat(new Date(), "yyyyMMddHHmmss") + ext;
            
            File targetFile = new File(path, fileName);
            if (!targetFile.exists())
            {
                targetFile.mkdirs();
            }
            // 修改
            try
            {
                image.transferTo(targetFile);
            }
            catch (Exception e)
            {
                result = e.getMessage();
            }
        }
        
        if(StringUtils.isEmpty(txt)){
            result = "文本不能为空！";
        }else{
            // 推送微信
            service.pushAd(fileName, txt);
            result = "消息已推送";
        }
        
        model.addAttribute("info", result);
        return "web/pushAd";
    }
}
