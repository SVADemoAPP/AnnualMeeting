/**   
 * @Title: AccountService.java 
 * @Package com.sva.service 
 * @Description: 账户处理
 * @author labelCS   
 * @date 2018年1月11日 下午3:37:19 
 * @version V1.0   
 */
package com.sva.service;

import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sva.dao.WeixinDao;
import com.sva.model.AccountModel;
import com.sva.model.FuModel;

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

    private static final int CODE_SUCCESS = 200; // 成功，通用

    private static final int CODE_FAIL = 400; // 失败，通用

    private static final int CODE_LOSE_OPENID = 301; // openid被顶掉

    @Autowired
    private WeixinDao weixinDao;

    /**
     * 
     * @Title: getAccountIdByOpenid 
     * @Description: 通过openid取得用户
     * @param openid
     * @return
     */
    public AccountModel getAccountIdByOpenid(String openid) {
        return weixinDao.getAccountIdByOpenid(openid);
    }

    /**
     * 
     * @Title: login 
     * @Description: 登录功能，openid绑定用户
     * @param accountModel
     * @return
     */
    public AccountModel login(AccountModel accountModel) {
        int code = weixinDao.login(accountModel);
        if (code > 0) {
            return weixinDao.getAccountIdByOpenid(accountModel.getOpenid());
        } else {
            return null;
        }
    }

    /**
     * 
     * @Title: logout 
     * @Description: 注销登录
     * @param openid
     */
    public void logout(String openid) {
        weixinDao.logout(openid);
    }

    /**
     * 
     * @Title: getUserFus 
     * @Description: 获取用户的福字数量 
     * @param openid
     * @return
     */
    public AccountModel getUserFus(String openid) {
        return weixinDao.getUserFus(openid);
    }
    
    /**
     * 
     * @Title: getUserInfo 
     * @Description: 获取用户信息
     * @param openid
     * @return
     */
    public AccountModel getUserInfo(String openid) {
        return weixinDao.getUserInfo(openid);
    }
    
    /**
     * 
     * @Title: operationFu
     * @Description: 操作福的整个过程
     * @param resultMap
     * @param openid
     */
    public void operationFu(Map<String, Object> resultMap, String openid) {
        int fu = randomFu();
        switch (fu) {
        case 1:
        case 2:
        case 3:
        case 4:
            Date nextRandomTime=new Date(System.currentTimeMillis()+15*60*1000);
            int code = weixinDao.userGetOneFu("fu" + fu, openid,nextRandomTime);
            if (code == 0) {
                // 失败则福字回滚且返回openid失效的说明
                weixinDao.changeOneFu(fu, 1);
                resultMap.put("resultCode", CODE_LOSE_OPENID);
            } else {
                // 加福字成功
                AccountModel account = weixinDao.getUserFus(openid);
                if (account != null) {
                    int fu1 = account.getFu1();
                    int fu2 = account.getFu2();
                    int fu3 = account.getFu3();
                    int fu4 = account.getFu4();
                    int fu5 = account.getFu5();
                    int remainRandomCount=account.getRemainRandomCount();
                    
                    // 若4个福都有，则自动合成一个fu5
                    if (fu1 > 0 && fu2 > 0 && fu3 > 0 && fu4 > 0) {
                        int code2 = weixinDao.compoundOneFu(openid);
                        if (code2 > 0) {
                            fu1--;
                            fu2--;
                            fu3--;
                            fu4--;
                            fu5++;
                        }
                    }
                    resultMap.put("resultCode", CODE_SUCCESS);
                    resultMap.put("fu1", fu1);
                    resultMap.put("fu2", fu2);
                    resultMap.put("fu3", fu3);
                    resultMap.put("fu4", fu4);
                    resultMap.put("fu5", fu5);
                    resultMap.put("remainRandomCount", remainRandomCount);
                    resultMap.put("nextRandomTime", nextRandomTime);
                    //该次取得的福字id
                    resultMap.put("nowFu", fu);

                } else {
                    resultMap.put("resultCode", CODE_LOSE_OPENID);
                }
            }
            break;
        case -1:
            resultMap.put("resultCode", CODE_FAIL);
            break;
        default:
            resultMap.put("resultCode", CODE_FAIL);
            break;
        }

    }

    /**
     * 
     * @Title: randomFu
     * @Description: 随机产生福
     * @return
     */
    private synchronized int randomFu() {
        List<FuModel> fuModelList = weixinDao.getFuList();
        if (fuModelList == null || fuModelList.size() == 0) {
            return -1; // 取福失败
        }
        int resultId = 0;
        int allWeight = 0;
        for (FuModel fuModel : fuModelList) {
            allWeight += fuModel.getWeight();
        }
        int nowWeight = 0;
        int randomWeight = new Random().nextInt(allWeight) + 1;
        for (FuModel fuModel : fuModelList) {
            nowWeight += fuModel.getWeight();
            if (nowWeight >= randomWeight) {
                resultId = fuModel.getId();
                break;
            }
        }
        // 减去一个福
        int code = weixinDao.changeOneFu(resultId, -1);
        if (code == 0) {
            resultId = -1; // 取福失败
        }
        return resultId;
    }
}
