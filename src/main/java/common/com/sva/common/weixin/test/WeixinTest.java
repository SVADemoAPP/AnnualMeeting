package com.sva.common.weixin.test;

import com.sva.common.weixin.bean.AccessToken;
import com.sva.common.weixin.utils.WeixinUtil;

public class WeixinTest {
	public static void main(String[] args) {
		try {
			AccessToken token = WeixinUtil.getAccessToken();
			System.out.println("票据"+token.getAccess_token());
			System.out.println("有效时间"+token.getExpires_in());
			
			//String path = "D:/imooc.jpg";
			//String mediaId = WeixinUtil.upload(path, token.getToken(), "thumb");
			//System.out.println(mediaId);
			
			//String result = WeixinUtil.translateFull("");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
