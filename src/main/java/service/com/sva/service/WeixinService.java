/**   
 * @Title: AccountService.java 
 * @Package com.sva.service 
 * @Description: 账户处理
 * @author labelCS   
 * @date 2018年1月11日 下午3:37:19 
 * @version V1.0   
 */
package com.sva.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sva.dao.WeixinDao;
import com.sva.model.AccountModel;

/**
 * 
 * @ClassName: WeixinService
 * @Description: 微信相关处理
 * @author gyr
 * @date 2018年1月18日 上午9:52:21
 *
 */
@Service
public class WeixinService {

    @Autowired
    private WeixinDao weixinDao;

    public AccountModel getAccountIdByOpenid(String openid) {
        return weixinDao.getAccountIdByOpenid(openid);
    }

    public AccountModel login(AccountModel accountModel) {
        int code = weixinDao.login(accountModel);
        if (code > 0) {
            return weixinDao.getAccountIdByOpenid(accountModel.getOpenid());
        } else {
            return null;
        }
    }
    
    public void logout(String openid) {
        weixinDao.logout(openid);
    }
}
