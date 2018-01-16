package com.sva.web.controllers;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sva.common.weixin.utils.CheckUtil;
import com.sva.common.weixin.utils.MessageUtil;

/**
 * 
 * @ClassName: WeixinController
 * @Description: 微信公众号相关controller
 * @author gyr
 * @date 2018年1月16日 上午10:30:31
 *
 */
@Controller
@RequestMapping(value = "/weixin")
public class WeixinController {

    private static final Logger LOG = Logger.getLogger(WeixinController.class);

    @RequestMapping(value = "", method = { RequestMethod.GET })
    @ResponseBody
    public String weixinGet(HttpServletRequest req, HttpServletResponse resp) {
        String signature = req.getParameter("signature");
        String timestamp = req.getParameter("timestamp");
        String nonce = req.getParameter("nonce");
        String echostr = req.getParameter("echostr");
        if (CheckUtil.check(signature, timestamp, nonce)) {
            return echostr;
        } else {
            return "error";
        }
    }

    @RequestMapping(value = "", method = { RequestMethod.POST })
    @ResponseBody
    public String weixinPost(HttpServletRequest req, HttpServletResponse resp) {
//        req.setCharacterEncoding("UTF-8");
//        resp.setCharacterEncoding("UTF-8");
        // 获取数据并转换为集合
        Map<String, String> map = MessageUtil.xmlToMap(req);
        // 分别解析对应字段
        String fromUserName = map.get("FromUserName");
        String toUserName = map.get("ToUserName");
        String msgType = map.get("MsgType");
        String content = map.get("Content");

        // 判断消息类型
        String msg = null;
        System.out.println(msgType);
        switch (msgType)
        {
        case MessageUtil.MESSAGE_TEXT:
            if ("1".equals(content))
            {
                msg = MessageUtil.setTextMsg(fromUserName, toUserName, "内容1");
            } else if ("2".equals(content))
            {
                msg = MessageUtil.setNewsMsg(fromUserName, toUserName);
            } else if ("?".equals(content) || "？".equals(content))
            {
                msg = MessageUtil.setTextMsg(fromUserName, toUserName, MessageUtil.menuMsg());
            } else
            {
                // 其他字符回复主菜单
                msg = MessageUtil.setTextMsg(fromUserName, toUserName, MessageUtil.menuMsg());
            }
            break;
        case MessageUtil.MESSAGE_EVENT:
            String event = map.get("Event");
            if (MessageUtil.MESSAGE_SUBSCRIBE.equals(event))
            {
                msg = MessageUtil.setNewsMsg(fromUserName, toUserName);
            }
            break;

        default:
            break;
        }
        return msg;
    }
}
