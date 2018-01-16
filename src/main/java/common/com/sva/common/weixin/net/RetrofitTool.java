package com.sva.common.weixin.net;

/*import com.google.gson.Gson;
import com.hangao.bean.BaseMsg;

import retrofit2.Retrofit;
import retrofit2.adapter.rxjava.RxJavaCallAdapterFactory;
import retrofit2.converter.gson.GsonConverterFactory;
import retrofit2.http.GET;
import retrofit2.http.Query;
import rx.Observable;*/

public class RetrofitTool
{
   /* private final static String BASE_URL = "https://api.weixin.qq.com";
    public static WeixinService weixinService;

    public static WeixinService getInstance()
    {
        if (weixinService == null)
        {
            Retrofit retrofit = new Retrofit.Builder().baseUrl(BASE_URL)
                    .addConverterFactory(GsonConverterFactory.create())
                    .addCallAdapterFactory(RxJavaCallAdapterFactory.create()).build();
            weixinService = retrofit.create(WeixinService.class);
        }
        return weixinService;
    }

    public interface WeixinService
    {
        @GET("cgi-bin/token")
        Observable<GetAccessTokenResponse> getAccessToken(@Query("grant_type") String newsId,
                @Query("appid") String appid, @Query("secret") String secret);
    }*/

}
