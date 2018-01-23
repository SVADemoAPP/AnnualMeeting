package com.sva.common.weixin.test;

import com.sva.common.conf.Params;
import com.sva.common.weixin.utils.WeixinUtil;

public class WeixinTest {
    public static void main(String[] args) {
//        test2();
        // test2();
//        WeixinUtil.pushMsg("omWBL1pLyb_3AY3VLhj5iTpjQQyI", "text","");
//        WeixinUtil.upload("d://car.jpg", "image");
        String openid="omWBL1pLyb_3AY3VLhj5iTpjQQyI";
        WeixinUtil.pushNews(openid, "标题1", "描述文字", "http://"+WeixinUtil.SERVER_URL+"/sva/weixin/skipPrize?openid="+openid, "http://"+WeixinUtil.SERVER_URL+"/sva/images/prize.png");
        
    
    }

    
}
