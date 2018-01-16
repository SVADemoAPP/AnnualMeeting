package com.sva.common.weixin.bean;

public class AccessToken
{
    private int id;
    public String access_token;
    public int expires_in;
    public long put_time;
    public int getId()
    {
        return id;
    }
    public void setId(int id)
    {
        this.id = id;
    }
    public String getAccess_token()
    {
        return access_token;
    }
    public void setAccess_token(String access_token)
    {
        this.access_token = access_token;
    }
    public int getExpires_in()
    {
        return expires_in;
    }
    public void setExpires_in(int expires_in)
    {
        this.expires_in = expires_in;
    }
    public long getPut_time()
    {
        return put_time;
    }
    public void setPut_time(long put_time)
    {
        this.put_time = put_time;
    }

   

}
