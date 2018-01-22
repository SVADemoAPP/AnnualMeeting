package com.sva.common.weixin.test;

import com.sva.common.weixin.bean.AccessToken;
import com.sva.common.weixin.utils.WeixinUtil;

import net.sf.json.JSON;
import net.sf.json.JSONObject;

public class WeixinTest {
    public static void main(String[] args) {
        test2();
        // test2();
    }

    
    //测试token获取
    private static void test1() {
        try {
            AccessToken token = WeixinUtil.getAccessToken();
            System.out.println("票据" + token.getAccess_token());
            System.out.println("有效时间" + token.getExpires_in());

            // String path = "D:/imooc.jpg";
            // String mediaId = WeixinUtil.upload(path, token.getToken(),
            // "thumb");
            // System.out.println(mediaId);

            // String result = WeixinUtil.translateFull("");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    
    //测试文字推送
    private static void test2() {
        String token="6_MKkuMX-Cs25s51xhGUq_SJ43cscYbBMqz5dUv6rBfm9LsoKnmotLCO12TWKqInvLQMtzbJnqyoQzX-ga_HA3RYiA7vucTGUhU8fMdmCS78nKwif9v4jnB1kW6dTCbVyvp9H8SUci-nqcG2nkMMTfABAEEL";
        JSONObject params=new JSONObject();
        params.put("touser", "omWBL1pLyb_3AY3VLhj5iTpjQQyI");
        params.put("msgtype", "text");
        JSONObject ob =new JSONObject();
        ob.put("content", "测试一下文字推送");
        params.put("text", ob);
        JSONObject jsonObj = WeixinUtil.doPostStr("https://api.weixin.qq.com/cgi-bin/message/custom/send?access_token="+token, params.toString());
        System.out.println(jsonObj);

    }
}
