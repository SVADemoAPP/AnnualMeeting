package com.sva.common.weixin.bean;


public class TextMessage extends BaseMsg
{

    private String Content;
    private String MsgId;

    public String getContent()
    {
        return Content;
    }

    public void setContent(String content)
    {
        Content = content;
    }

    public String getMsgId()
    {
        return MsgId;
    }

    public void setMsgId(String msgId)
    {
        MsgId = msgId;
    }

}
