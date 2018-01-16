package com.sva.common.weixin.dao;

import org.apache.ibatis.session.SqlSession;

import com.sva.common.weixin.bean.AccessToken;
import com.sva.common.weixin.db.DBAccess;
import com.sva.common.weixin.utils.WeixinUtil;


public class WeixinDao
{
    public static void checkAccessToken()
    {
        WeixinUtil.getAccessToken(1);
        DBAccess dbAccess = new DBAccess();
        SqlSession sqlSession = null;
        try
        {
            sqlSession = dbAccess.getSqlSession();
            AccessToken accessToken = sqlSession.selectOne("weixinInfo.getAccessToken", 1);

            if (accessToken != null)
            {
                long lastTime = (System.currentTimeMillis() - accessToken.getPut_time()) / 1000;
                if (lastTime < accessToken.getExpires_in())
                {
                    System.out.println(
                            "access_token有效剩余时间:" + (accessToken.getExpires_in() - lastTime) + "s");
                } else
                {
                    System.out.println("重新获取access_token");
                    WeixinUtil.getAccessToken(1);
                }
            } else
            {
                System.out.println("获取access_token");
                WeixinUtil.getAccessToken(0);
            }
        } catch (Exception e)
        {
            System.out.println("错误：" + e.toString());
        } finally
        {
            if (sqlSession != null)
            {
                sqlSession.close();
            }
        }
    }
}
