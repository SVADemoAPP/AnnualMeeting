package com.sva.common.weixin.bean;


public class EventMessage extends BaseMsg
{
    private String Event;// 事件类型，VIEW
    private String EventKey;

    public String getEvent()
    {
        return Event;
    }

    public void setEvent(String event)
    {
        Event = event;
    }

    public String getEventKey()
    {
        return EventKey;
    }

    public void setEventKey(String eventKey)
    {
        EventKey = eventKey;
    }

}
