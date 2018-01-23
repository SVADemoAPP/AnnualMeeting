package com.sva.web.controllers;

import java.io.UnsupportedEncodingException;
import java.net.URL;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.Map;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sva.common.conf.Params;
import com.sva.common.weixin.utils.CheckUtil;
import com.sva.common.weixin.utils.MessageUtil;
import com.sva.common.weixin.utils.WeixinUtil;
import com.sva.model.AccountModel;
import com.sva.service.WeixinService;

import net.sf.json.JSONObject;

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

    private static final int CODE_SUCCESS = 200;

    private static final int CODE_FAIL = 400;

    @Autowired
    private WeixinService weixinService;

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
        // req.setCharacterEncoding("UTF-8");
        // resp.setCharacterEncoding("UTF-8");
        // 获取数据并转换为集合
        Map<String, String> map = MessageUtil.xmlToMap(req);
        // 分别解析对应字段
        String fromUserName = map.get("FromUserName");
        String toUserName = map.get("ToUserName");
        String msgType = map.get("MsgType");
        String content = map.get("Content");

        // 判断消息类型
        String msg = null;

        switch (msgType) {
        case MessageUtil.MESSAGE_TEXT:
            if ("1".equals(content)) {
                msg = MessageUtil.setTextMsg(fromUserName, toUserName, "内容1");
            } else if ("2".equals(content)) {
                msg = MessageUtil.setNewsMsg(fromUserName, toUserName);
            } else if ("?".equals(content) || "？".equals(content)) {
                msg = MessageUtil.setTextMsg(fromUserName, toUserName, MessageUtil.menuMsg());
            } else {
                // 其他字符回复主菜单
                msg = MessageUtil.setTextMsg(fromUserName, toUserName, MessageUtil.menuMsg());
            }
            break;
        case MessageUtil.MESSAGE_EVENT:
            String event = map.get("Event");
            // System.out.println("event事件类型："+event);
            if (MessageUtil.MESSAGE_SUBSCRIBE.equals(event)) {
                msg = MessageUtil.setNewsMsg(fromUserName, toUserName);
            } else {
                // req.getSession().setAttribute("fromUserName", fromUserName);
            }
            break;

        default:
            break;
        }
        System.out.println(msgType + " " + fromUserName + " " + msg);
        return msg;
    }

    @RequestMapping(value = "/introRedirect", method = RequestMethod.GET)
    public String introRedirect(HttpServletRequest req, HttpServletResponse response)
            throws UnsupportedEncodingException {
        return "redirect:https://open.weixin.qq.com/connect/oauth2/authorize?appid=" + WeixinUtil.APPID
                + "&redirect_uri="
                + URLEncoder.encode("http://" + WeixinUtil.SERVER_URL + "/sva/weixin/switchPage", "utf-8")
                + "?response_type=code&scope=snsapi_userinfo&state=intro#wechat_redirect";
    }

    @RequestMapping(value = "/fukaRedirect", method = RequestMethod.GET)
    public String fukaRedirect(HttpServletRequest req, HttpServletResponse response)
            throws UnsupportedEncodingException {
        return "redirect:https://open.weixin.qq.com/connect/oauth2/authorize?appid=" + WeixinUtil.APPID
                + "&redirect_uri="
                + URLEncoder.encode("http://" + WeixinUtil.SERVER_URL + "/sva/weixin/switchPage", "utf-8")
                + "?response_type=code&scope=snsapi_userinfo&state=fuka#wechat_redirect";
    }

    @RequestMapping(value = "/mineRedirect", method = RequestMethod.GET)
    public String mineRedirect(HttpServletRequest req, HttpServletResponse response)
            throws UnsupportedEncodingException {
        return "redirect:https://open.weixin.qq.com/connect/oauth2/authorize?appid=" + WeixinUtil.APPID
                + "&redirect_uri="
                + URLEncoder.encode("http://" + WeixinUtil.SERVER_URL + "/sva/weixin/switchPage", "utf-8")
                + "?response_type=code&scope=snsapi_userinfo&state=mine#wechat_redirect";
    }

    @RequestMapping(value = "/switchPage", method = { RequestMethod.GET })
    public String fuka(HttpServletRequest req) {
        String CODE = req.getParameter("code");
        String STATE = req.getParameter("state");
        String URL = "https://api.weixin.qq.com/sns/oauth2/access_token?appid=APPID&secret=SECRET&code=CODE&grant_type=authorization_code"
                .replace("APPID", WeixinUtil.APPID).replace("SECRET", WeixinUtil.APPSECRET).replace("CODE", CODE);
        JSONObject jsonObj = WeixinUtil.doGetStr(URL);
        String openid = jsonObj.get("openid").toString();
        AccountModel accountModel = weixinService.getAccountIdByOpenid(openid);
        req.getSession().setAttribute("openid", openid);
        req.getSession().setAttribute("accountModel", accountModel);
        req.getSession().removeAttribute("fromNews");
        return "weixin/" + STATE;
    }

    @RequestMapping(value = "/skipPrize", method = { RequestMethod.GET })
    public String skipPrize(HttpServletRequest req) {
        String openid = req.getParameter("openid");
        AccountModel accountModel = weixinService.getAccountIdByOpenid(openid);
        req.getSession().setAttribute("openid", openid);
        req.getSession().setAttribute("accountModel", accountModel);
        req.getSession().setAttribute("fromNews", "yes");
        return "weixin/intro";
    }

    @RequestMapping(value = "/login", method = { RequestMethod.POST })
    @ResponseBody
    public Map<String, Object> login(HttpServletRequest req, AccountModel accountModel) {
        Map<String, Object> resultMap = new HashMap<>();
        AccountModel loginModel = weixinService.login(accountModel);
        if (loginModel != null) {
            resultMap.put("resultCode", CODE_SUCCESS);
            req.setAttribute("accountModel", loginModel);
            resultMap.put("resultMsg", loginModel);
        } else {
            resultMap.put("resultCode", CODE_FAIL);
        }
        return resultMap;
    }
    
    @RequestMapping(value = "/logout", method = { RequestMethod.POST })
    @ResponseBody
    public Map<String, Object> logout(HttpServletRequest req, String openid) {
        Map<String, Object> resultMap = new HashMap<>();
        
        resultMap.put("resultCode", CODE_SUCCESS);
        req.removeAttribute("accountModel");
        return resultMap;
    }

    
}
