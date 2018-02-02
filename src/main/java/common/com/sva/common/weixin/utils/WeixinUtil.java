package com.sva.common.weixin.utils;

import java.io.BufferedReader;
import java.io.DataInputStream;
import java.io.DataOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.security.KeyManagementException;
import java.security.NoSuchAlgorithmException;
import java.security.NoSuchProviderException;

import org.apache.commons.lang.StringUtils;
import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.ParseException;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.DefaultHttpClient;
import org.apache.http.util.EntityUtils;

import com.sva.common.weixin.bean.AccessToken;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

//import rx.Observable;
//import rx.Subscriber;
//import rx.schedulers.Schedulers;

public class WeixinUtil {

    // accessToken
    public static String lastToken = "";

    // 上次获取到token的时间戳
    public static long tokenTime = 0;

    private final static String grant_type = "client_credential";
    // private final static String appid = "wxbab55d45abfbb9bc";
    // private final static String secret = "246883272034517bdfbef75a74a991f5";
    // test
    // public final static String SERVER_URL = "zrwb.mynatapp.cc";
    public final static String APPID = "wx216621f9da064342";
    public final static String APPSECRET = "3de7691660915cbdcf9757825bb2e242";

    // 获取token地址
    private static final String ACCESS_TOKEN_URL = "https://api.weixin.qq.com/cgi-bin/token?grant_type=client_credential&appid=APPID&secret=APPSECRET";

    // 文件上传地址
    private static final String UPLOAD_URL = "https://api.weixin.qq.com/cgi-bin/media/upload?access_token=ACCESS_TOKEN&type=TYPE";

    private static final String PUSH_MSG_URL = "https://api.weixin.qq.com/cgi-bin/message/custom/send?access_token=ACCESS_TOKEN";

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
    public static JSONObject doGetStr(String url) {
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

    /**
     * 
     * @Title: getTokenString
     * @Description: TODO(这里用一句话描述这个方法的作用)
     * @return
     * @throws ParseException
     * @throws IOException
     */
    public static String getTokenString() {
        String token = "";
        long nowTime = System.currentTimeMillis();
        // 相差小于100分钟并且token不为空则直接取，否则重新获取
        if (nowTime - tokenTime < 1000 * 60 * 100 && StringUtils.isNotEmpty(lastToken)) {
            token = lastToken;
        } else {
            String url = ACCESS_TOKEN_URL.replace("APPID", APPID).replace("APPSECRET", APPSECRET);
            JSONObject jsonObject = doGetStr(url);
            if (jsonObject != null) {
                token = jsonObject.getString("access_token");
            }
            // 更新当前token信息
            tokenTime = nowTime;
            lastToken = token;
        }
        System.out.println("token:" + token);
        return token;
    }

    /**
     * 文件上传
     * 
     * @param filePath
     * @param accessToken
     * @param type
     * @return
     * @throws IOException
     * @throws NoSuchAlgorithmException
     * @throws NoSuchProviderException
     * @throws KeyManagementException
     */
    public static String upload(String filePath, String type) {
        String mediaId = "";
        try {
            File file = new File(filePath);
            if (!file.exists() || !file.isFile()) {
                throw new IOException("文件不存在");
            }

            String url = UPLOAD_URL.replace("ACCESS_TOKEN", getTokenString()).replace("TYPE", type);

            URL urlObj = new URL(url);
            // 连接
            HttpURLConnection con = (HttpURLConnection) urlObj.openConnection();

            con.setRequestMethod("POST");
            con.setDoInput(true);
            con.setDoOutput(true);
            con.setUseCaches(false);

            // 设置请求头信息
            con.setRequestProperty("Connection", "Keep-Alive");
            con.setRequestProperty("Charset", "UTF-8");

            // 设置边界
            String BOUNDARY = "----------" + System.currentTimeMillis();
            con.setRequestProperty("Content-Type", "multipart/form-data; boundary=" + BOUNDARY);

            StringBuilder sb = new StringBuilder();
            sb.append("--");
            sb.append(BOUNDARY);
            sb.append("\r\n");
            sb.append("Content-Disposition: form-data;name=\"file\";filename=\"" + file.getName() + "\"\r\n");
            sb.append("Content-Type:application/octet-stream\r\n\r\n");

            byte[] head = sb.toString().getBytes("utf-8");

            // 获得输出流
            OutputStream out = new DataOutputStream(con.getOutputStream());
            // 输出表头
            out.write(head);

            // 文件正文部分
            // 把文件已流文件的方式 推入到url中
            DataInputStream in = new DataInputStream(new FileInputStream(file));
            int bytes = 0;
            byte[] bufferOut = new byte[1024];
            while ((bytes = in.read(bufferOut)) != -1) {
                out.write(bufferOut, 0, bytes);
            }
            in.close();

            // 结尾部分
            byte[] foot = ("\r\n--" + BOUNDARY + "--\r\n").getBytes("utf-8");// 定义最后数据分隔线

            out.write(foot);

            out.flush();
            out.close();

            StringBuffer buffer = new StringBuffer();
            BufferedReader reader = null;
            String result = null;
            try {
                // 定义BufferedReader输入流来读取URL的响应
                reader = new BufferedReader(new InputStreamReader(con.getInputStream()));
                String line = null;
                while ((line = reader.readLine()) != null) {
                    buffer.append(line);
                }
                if (result == null) {
                    result = buffer.toString();
                }
            } catch (IOException e) {
                e.printStackTrace();
            } finally {
                if (reader != null) {
                    reader.close();
                }
            }

            JSONObject jsonObj = JSONObject.fromObject(result);
            System.out.println(jsonObj);
            String typeName = "media_id";
            if (!"image".equals(type)) {
                typeName = type + "_media_id";
            }
            mediaId = jsonObj.getString(typeName);
        } catch (Exception e) {
            // TODO: handle exception
        }

        return mediaId;
    }

    /**
     * 
     * @Title: pushMsg
     * @Description: 公众号界面各种消息推送，该方法保留备用
     * @param openid
     * @param type
     */
    public static void pushMsg(String openid, String type, String media_id) {
        String url = PUSH_MSG_URL.replace("ACCESS_TOKEN", getTokenString());
        JSONObject params = new JSONObject();
        params.put("touser", openid);
        params.put("msgtype", type);
        JSONObject msgBody = new JSONObject();
        if ("text".equals(type)) {
            msgBody.put("content", "测试一下文字推送");
        } else if ("image".equals(type)) {
            msgBody.put("media_id", media_id);

        } else if ("news".equals(type)) {
            JSONArray articles = new JSONArray();
            JSONObject temp = new JSONObject();
            temp.put("title", "test1");
            temp.put("description", "test2");
            temp.put("url", "test3");
            temp.put("picurl", "test4");
            articles.add(temp);
            msgBody.put("articles", articles);
        }
        params.put(type, msgBody);
        JSONObject jsonObj = WeixinUtil.doPostStr(url, params.toString());
        System.out.println(jsonObj);
    }

    /**
     * 
     * @Title: pushNews
     * @Description: 推送图文消息，单条
     * @param openid
     * @param type
     * @param media_id
     */
    public static void pushNews(final String openid, final String title, final String description, final String url, final String picurl) {
        new Thread(new Runnable() {
            
            @Override
            public void run() {
                // TODO Auto-generated method stub
                String wxUrl = PUSH_MSG_URL.replace("ACCESS_TOKEN", getTokenString());
                JSONObject params = new JSONObject();
                params.put("touser", openid);
                params.put("msgtype", "news");
                JSONObject msgBody = new JSONObject();
                // 放入一条图文消息
                JSONArray articles = new JSONArray();
                JSONObject temp = new JSONObject();
                temp.put("title", title);
                temp.put("description", description);
                temp.put("url", url);
                temp.put("picurl", picurl);
                articles.add(temp);
                msgBody.put("articles", articles);
                params.put("news", msgBody);
                JSONObject jsonObj = WeixinUtil.doPostStr(wxUrl, params.toString());
                System.out.println(jsonObj);
            }
        }).start();
       
    }

    /**
     * 
     * @Title: pushMsg
     * @Description: 推送文字消息
     * @param openid
     * @param type
     */
    public static void pushText(final String openid, final String content) {
        new Thread(new Runnable() {
            
            @Override
            public void run() {
                // TODO Auto-generated method stub
                String url = PUSH_MSG_URL.replace("ACCESS_TOKEN", getTokenString());
                JSONObject params = new JSONObject();
                params.put("touser", openid);
                params.put("msgtype", "text");
                JSONObject msgBody = new JSONObject();
                msgBody.put("content", content);
                params.put("text", msgBody);
                JSONObject jsonObj = WeixinUtil.doPostStr(url, params.toString());
                System.out.println(jsonObj);
            }
        }).start();
       
    }

}
