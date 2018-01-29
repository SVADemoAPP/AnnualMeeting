package com.sva.common.weixin.test;

import com.sva.common.weixin.utils.WeixinUtil;

public class WeixinTest {
    public static void main(String[] args) {
        String openid="odLWc0rMATdo4RB2lPsLgPsl_Gyw";
//        WeixinUtil.pushNews(openid, "标题1", "描述文字", "http://zrwb.mynatapp.cc/sva/weixin/skipPrize?openid="+openid, "http://zrwb.mynatapp.cc/sva/images/prize.png");
        
        WeixinUtil.pushText(openid, "你是哈皮");
    }

    
}
