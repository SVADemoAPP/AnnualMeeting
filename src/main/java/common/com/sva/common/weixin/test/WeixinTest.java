package com.sva.common.weixin.test;

import com.sva.common.HttpUtil;
import com.sva.common.weixin.utils.WeixinUtil;

public class WeixinTest {
    public static void main(String[] args) {
        String openid="odLWc0ua76lELp0rpwkzkbEIr5yc";
//        WeixinUtil.pushNews(openid, "标题1", "描述文字", "http://zrwb.mynatapp.cc/sva/weixin/skipPrize?openid="+openid, "http://zrwb.mynatapp.cc/sva/images/prize.png");
        
        WeixinUtil.pushText(openid, "测试一下推送");
        
//        WeixinUtil.doGetStr("http://localhost:80/sva/weixin/pushSse?type=sentMessage&msg=ddd");
    }

    
}
