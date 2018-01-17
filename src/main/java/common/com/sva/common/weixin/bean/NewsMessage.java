package com.sva.common.weixin.bean;

import java.util.List;

/**
 * 图文消息
 * 
 * @author 10023
 *
 */
public class NewsMessage extends BaseMsg
{
    private int ArticleCount;// 最大限制8，否则无响应
    private List<News> Articles;

    public int getArticleCount()
    {
        return ArticleCount;
    }

    public void setArticleCount(int articleCount)
    {
        ArticleCount = articleCount;
    }

    public List<News> getArticles()
    {
        return Articles;
    }

    public void setArticles(List<News> articles)
    {
        Articles = articles;
    }

}
