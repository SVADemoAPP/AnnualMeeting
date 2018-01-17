package com.sva.common.weixin.net;

/**
 * access token 返回实体
 * 
 * @author 10023
 *
 */
public class GetAccessTokenResponse
{
    private String access_token;
    private int expires_in=1;

    public void setAccess_token(String access_token)
    {
        this.access_token = access_token;
    }

    public String getAccess_token()
    {
        return access_token;
    }

    public void setExpires_in(int expires_in)
    {
        this.expires_in = expires_in;
    }

    public int getExpires_in()
    {
        return expires_in;
    }

}
