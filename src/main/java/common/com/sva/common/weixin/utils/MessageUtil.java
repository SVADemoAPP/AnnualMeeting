package com.sva.common.weixin.utils;

import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.dom4j.Document;
import org.dom4j.DocumentException;
import org.dom4j.Element;
import org.dom4j.io.SAXReader;

import com.sva.common.weixin.bean.BaseMsg;
import com.sva.common.weixin.bean.News;
import com.sva.common.weixin.bean.NewsMessage;
import com.sva.common.weixin.bean.TextMessage;
import com.thoughtworks.xstream.XStream;
import com.thoughtworks.xstream.io.xml.StaxDriver;

public class MessageUtil
{
    /*
     * 文本消息-text 图片消息-image 语音消息-voice 视频消息-video 链接消息-link 地理位置消息-location
     * 事件推送-event ----关注-subscribe ----取消关注-unsubscribe ----菜单点击-CLICK、VIEW
     */
    public final static String MESSAGE_NEWS = "news";
    public final static String MESSAGE_TEXT = "text";
    public final static String MESSAGE_IMAGE = "image";
    public final static String MESSAGE_VOICE = "voice";
    public final static String MESSAGE_VIDEO = "video";
    public final static String MESSAGE_LINK = "link";
    public final static String MESSAGE_LOCATION = "location";
    public final static String MESSAGE_EVENT = "event";
    public final static String MESSAGE_SUBSCRIBE = "subscribe";
    public final static String MESSAGE_UNSUBSCRIBE = "unsubscribe";
    public final static String MESSAGE_CLICK = "CLICK";
    public final static String MESSAGE_VIEW = "VIEW";

    /**
     * 解析xml内容到map集合
     */
    public final static Map<String, String> xmlToMap(HttpServletRequest req)
    {
        Map<String, String> map = new HashMap<>();
        // 读取传入的xml
        try
        {
            // 获取输入流
            InputStream ins = req.getInputStream();
            // 新建saxreader
            SAXReader reader = new SAXReader();
            try
            {
                // 获取Document对象
                Document doc = reader.read(ins);
                // 获取根节点
                Element rootElement = doc.getRootElement();
                // 获取所有子节点
                List<Element> elements = rootElement.elements();
                // 读取子节点
                for (Element each : elements)
                {
                    map.put(each.getName(), each.getText());
                }
                ins.close();

            } catch (DocumentException e)
            {
                // TODO Auto-generated catch block
                e.printStackTrace();
            }
        } catch (IOException e)
        {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return map;
    }

    /**
     * 将内容转换为xml
     */
    public static String textMessageToXml(BaseMsg textMsg)
    {
        XStream xStream = new XStream(new StaxDriver());
        // 替换标签
        xStream.alias("xml", textMsg.getClass());
        return xStream.toXML(textMsg);
    }

    /**
     * 图文消息转xml
     */
    public static String newsMessageToXml(NewsMessage newsMessage)
    {
        XStream xStream = new XStream(new StaxDriver());
        // 替换标签
        xStream.alias("xml", newsMessage.getClass());
        xStream.alias("item", new News().getClass());
        return xStream.toXML(newsMessage);
    }

    /**
     * 回复文字消息
     */
    public static String setTextMsg(String fromUserName, String toUserName, String content)
    {
        TextMessage tMessage = new TextMessage();
        tMessage.setToUserName(fromUserName);
        tMessage.setFromUserName(toUserName);
        tMessage.setCreateTime(String.valueOf(new Date().getTime()));
        tMessage.setMsgType(MessageUtil.MESSAGE_TEXT);
        tMessage.setContent(content);
        return MessageUtil.textMessageToXml(tMessage);
    }
    
    /**
     * 设置图文消息
     */
    public static String setNewsMsg(String fromUserName, String toUserName)
    {
        String msg = null;
        NewsMessage newsMessage = new NewsMessage();
        
        newsMessage.setFromUserName(toUserName);
        newsMessage.setToUserName(fromUserName);
        newsMessage.setMsgType(MESSAGE_NEWS);
        newsMessage.setCreateTime(String.valueOf(new Date().getTime()));
        
        List<News> newsList = new ArrayList();

        News news = new News();
        news.setDescription("这是一段详情介绍");
        news.setTitle("SVA简介");
        news.setPicUrl("http://hangao.free.ngrok.cc/Weixin/image/2.png");
        news.setUrl("http://hangao.free.ngrok.cc/Weixin/html/sva_introduce.html");
        
//        News news1 = new News();
//        news1.setDescription("测试内容2");
//        news1.setTitle("测试2");
//        news1.setPicUrl("http://hangao.free.ngrok.cc/Weixin/image/1.jpg");
//        news1.setUrl("http://hangao.free.ngrok.cc/Weixin/html/lottery.html");

        newsList.add(news);
//        newsList.add(news1);
        newsMessage.setArticleCount(newsList.size());
        newsMessage.setArticles(newsList);

        msg = newsMessageToXml(newsMessage);

        return msg;
    }

    /**
     * 主菜单选项
     */
    public static String menuMsg()
    {
        StringBuilder sb = new StringBuilder();
        sb.append("欢迎您关注智慧博览:\n\n");
        sb.append("1.测试1\n");
        sb.append("2.测试2\n\n");
        sb.append("回复?呼出此菜单");
        return sb.toString();
    }
}
