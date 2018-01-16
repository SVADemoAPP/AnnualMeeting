package com.sva.common.weixin.utils;

import java.security.MessageDigest;
import java.util.Arrays;

public class CheckUtil
{

    private final static String token = "chinasoft";

    public static boolean check(String signature, String timestamp, String nonce)
    {
        System.out.println("加密前signature:" + signature);
        String[] info = new String[]
        { token, timestamp, nonce };
        // 按照字典排序
        Arrays.sort(info);
        // 拼接字符串
        StringBuilder sb = new StringBuilder();
        for (int i = 0; i < info.length; i++)
        {
            sb.append(info[i]);
        }

        // 进行sha1加密
        String after = getSha1(sb.toString());
        System.out.println("加密后:" + after);
        return signature.equals(after);
    }

    /*
     * SHA1加密
     * 
     * @param 加密参数
     */
    public static String getSha1(String str)
    {
        if (str == null || str.length() == 0)
        {
            return null;
        }
        char hexDigits[] =
        { '0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'a', 'b', 'c', 'd', 'e', 'f' };
        try
        {
            MessageDigest mdTemp = MessageDigest.getInstance("SHA1");
            mdTemp.update(str.getBytes("UTF-8"));
            byte[] md = mdTemp.digest();
            int j = md.length;
            char buf[] = new char[j * 2];
            int k = 0;
            for (int i = 0; i < j; i++)
            {
                byte byte0 = md[i];
                buf[k++] = hexDigits[byte0 >> 4 & 0xf];
                buf[k++] = hexDigits[byte0 & 0xf];
            }
            return new String(buf);
        } catch (Exception e)
        {
            return null;
        }
    }
}
