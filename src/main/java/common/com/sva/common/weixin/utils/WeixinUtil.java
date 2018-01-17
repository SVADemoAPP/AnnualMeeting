package com.sva.common.weixin.utils;

import java.io.IOException;

import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.ParseException;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.DefaultHttpClient;
import org.apache.http.util.EntityUtils;

import com.sva.common.weixin.bean.AccessToken;

import net.sf.json.JSONObject;

//import rx.Observable;
//import rx.Subscriber;
//import rx.schedulers.Schedulers;

public class WeixinUtil {

    private final static String grant_type = "client_credential";
    // private final static String appid = "wxbab55d45abfbb9bc";
    // private final static String secret = "246883272034517bdfbef75a74a991f5";
    // test
    public final static String SERVER_URL = "4nnnsp.natappfree.cc";
    public final static String APPID = "wxf6e7f9bedaa4abf3";
    public final static String APPSECRET = "be2bae4a73c33d97b6b08fd8a49da6c4";

    private static final String ACCESS_TOKEN_URL = "https://api.weixin.qq.com/cgi-bin/token?grant_type=client_credential&appid=APPID&secret=APPSECRET";

    /**
     * 获取access_token 0 初始化 1 更新
     */
    public static void getAccessToken(int insertOrUpdate) {

    }

    /**
     * get请求
     * 
     * @param url
     * @return
     * @throws ParseException
     * @throws IOException
     */
    public static JSONObject doGetStr(String url)  {
        DefaultHttpClient client = new DefaultHttpClient();
        HttpGet httpGet = new HttpGet(url);
        JSONObject jsonObject = null;
        try {
            HttpResponse httpResponse = client.execute(httpGet);
            HttpEntity entity = httpResponse.getEntity();
            if (entity != null) {
                String result = EntityUtils.toString(entity, "UTF-8");
                jsonObject = JSONObject.fromObject(result);
            }
        } catch (Exception e) {
            // TODO: handle exception
        }
        return jsonObject;
    }

    /**
     * POST请求
     * 
     * @param url
     * @param outStr
     * @return
     * @throws ParseException
     * @throws IOException
     */
    public static JSONObject doPostStr(String url, String outStr) {
        DefaultHttpClient client = new DefaultHttpClient();
        HttpPost httpost = new HttpPost(url);
        JSONObject jsonObject = null;
        try {
            httpost.setEntity(new StringEntity(outStr, "UTF-8"));
            HttpResponse response = client.execute(httpost);
            String result = EntityUtils.toString(response.getEntity(), "UTF-8");
            jsonObject = JSONObject.fromObject(result);
        } catch (Exception e) {
            // TODO: handle exception
        }
        return jsonObject;
    }

    /**
     * 获取accessToken
     * 
     * @return
     * @throws ParseException
     * @throws IOException
     */
    public static AccessToken getAccessToken() throws ParseException, IOException {
        AccessToken token = new AccessToken();
        String url = ACCESS_TOKEN_URL.replace("APPID", APPID).replace("APPSECRET", APPSECRET);
        JSONObject jsonObject = doGetStr(url);
        if (jsonObject != null) {
            token.setAccess_token(jsonObject.getString("access_token"));
            token.setExpires_in(jsonObject.getInt("expires_in"));
        }
        return token;
    }
}
