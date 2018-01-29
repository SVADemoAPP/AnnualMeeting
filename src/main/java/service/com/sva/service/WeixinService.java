/**   
 * @Title: AccountService.java 
 * @Package com.sva.service 
 * @Description: 账户处理
 * @author labelCS   
 * @date 2018年1月11日 下午3:37:19 
 * @version V1.0   
 */
package com.sva.service;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sva.common.weixin.utils.WeixinUtil;
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

    private static final int CODE_LOSE_OPENID = 301; // openid被顶掉了

    private static final int CODE_TOUSER_NOT_EXIST = 302; // 赠送用户不存在

    private static final int CODE_NOT_TIME = 303; // 抽奖时间未到

    private static final int CODE_NOT_ENOUGH = -304; // 批量送福数量不够

    @Autowired
    private WeixinDao weixinDao;

    /**
     * 
     * @Title: getAccountByOpenid
     * @Description: 通过openid取得用户
     * @param openid
     * @return
     */
    public AccountModel getAccountByOpenid(String openid) {
        AccountModel accountModel = weixinDao.getAccountByOpenid(openid);
        if (accountModel != null) {
            weixinDao.updateHeart(accountModel.getUsername(), new Date());
        }
        return accountModel;
    }

    /**
     * 
     * @Title: login
     * @Description: 登录功能，openid绑定用户
     * @param accountModel
     * @return
     */
    public AccountModel login(AccountModel accountModel) {
        accountModel.setLastHeartbeat(new Date());
        int code = weixinDao.login(accountModel);
        if (code > 0) {
            return weixinDao.getAccountByOpenid(accountModel.getOpenid());
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
     * @Title: changePassword
     * @Description: 修改密码
     * @param openid
     * @param oldPwd
     * @param newPwd
     * @return
     */
    public Integer changePassword(String openid, String oldPwd, String newPwd) {
        int code = weixinDao.changePassword(openid, oldPwd, newPwd);
        if (code > 0) {
            return CODE_SUCCESS;
        } else {
            return CODE_FAIL;
        }
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
     * @Description: 随机抽取福的整个过程
     * @param resultMap
     * @param openid
     */
    public void operationFu(Map<String, Object> resultMap, String openid) {
        Date nextRandom = weixinDao.getNextRandomTime(openid);
        if (nextRandom == null) {
            resultMap.put("resultCode", CODE_LOSE_OPENID);
            return;
        }
        if (new Date().before(nextRandom)) {
            // 抽奖时间未到
            resultMap.put("resultCode", CODE_NOT_TIME);
            return;
        }
        int fu = allotFu(0, 0, 0);
        switch (fu) {
        case 1:
        case 2:
        case 3:
        case 4:
            Date nowTime = new Date();
            Date nextRandomTime = new Date(
                    (System.currentTimeMillis() + 15 * 60 * 1000) / (15 * 60 * 1000) * (15 * 60 * 1000));
            int code = weixinDao.userGetOneFu("fu" + fu, openid, nextRandomTime);
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
                    int remainRandomCount = account.getRemainRandomCount();

                    // 若4个福都有，则自动合成一个fu5
                    if (fu1 > 0 && fu2 > 0 && fu3 > 0 && fu4 > 0 && fu5 < 1) {
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
                    // 该次取得的福字id
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
     * @Title: allotFu
     * @Description: 抽福方法，type 0为个人随机抽福，type 1为web批量送福
     * @param type
     * @param fuId
     * @param count
     * @return
     */
    public synchronized int allotFu(int type, int fuId, int count) {
        if (0 == type) { // 个人随机抽福，福库取福方法
            return randomFu();
        } else if (1 == type) { // 批量送福，福库取福加分发。
            Integer remainCount = weixinDao.getCountByFuId(fuId);
            if (null == remainCount || count > remainCount) {
                return CODE_NOT_ENOUGH; // 数量不够
            }
            // 加福字成功
            String word = "";
            switch (fuId) {
            case 1:
                word = "燃";
                break;
            case 2:
                word = "情";
                break;
            case 3:
                word = "小";
                break;
            case 4:
                word = "站";
                break;
            default:
                break;
            }
            String columnName = "fu" + fuId;
            List<AccountModel> aList = weixinDao.getRandomAccount(columnName, count);
            // Map<String, String> pushTextMap = new HashMap<>(); // 推送的消息map
            List<String> idList = new ArrayList<>();
            for (AccountModel account : aList) {
                idList.add(account.getId());
            }
            int size = aList.size();
            if (idList.size() > 0) {
                weixinDao.updateRandomAccount(columnName, idList); // 批量发放福字
            }
            weixinDao.reduceCountByFuId(fuId, size);
            for (int i = size - 1; i >= 0; i--) {
                final AccountModel account = aList.get(i);
                String pushText = "你收到一个福字：" + word;
                int p1 = 0;
                int p2 = 0;
                int p3 = 0;
                switch (fuId) {
                case 1:
                    p1 = account.getFu2();
                    p2 = account.getFu3();
                    p3 = account.getFu4();
                    break;
                case 2:
                    p1 = account.getFu1();
                    p2 = account.getFu3();
                    p3 = account.getFu4();
                    break;
                case 3:
                    p1 = account.getFu1();
                    p2 = account.getFu2();
                    p3 = account.getFu4();
                    break;
                case 4:
                    p1 = account.getFu1();
                    p2 = account.getFu2();
                    p3 = account.getFu3();
                    break;
                default:
                    break;
                }
                if (p1 == 0 || p2 == 0 || p3 == 0 || account.getFu5() > 0) {
                    aList.remove(i);
                    idList.remove(i);
                } else {
                    pushText += ",并成功合成一个!";
                }
                final String temp = pushText;
                // 放入text推送的map
                if (null != account.getOpenid()) {
                    new Thread(new Runnable() {
                        @Override
                        public void run() {
                            // TODO Auto-generated method stub
                            WeixinUtil.pushText(account.getOpenid(), temp);
                        }
                    }).start();
                }
            }
            if (idList.size() > 0) {
                weixinDao.compoundRandomAccount(idList); // 批量合成福字
            }
            return size;
        }
        return 0;
    }

    /**
     * 
     * @Title: randomFu
     * @Description: 随机产生福
     * @return
     */
    private int randomFu() {
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

    /**
     * 
     * @Title: giveFu
     * @Description: 按用户名赠送福
     * @param openid
     * @param fromUsername
     * @param toUsername
     * @param fuId
     * @return
     */
    public int giveFu(String openid, String fromUsername, String toUsername, int fuId) {
        AccountModel toUser = weixinDao.getAccountByUsername(toUsername);
        if (toUser == null) {
            return CODE_TOUSER_NOT_EXIST;
        }
        int code = weixinDao.giveOneFu(fromUsername, openid, "fu" + fuId);
        if (code == 0) {
            return CODE_LOSE_OPENID;
        }
        int code2 = weixinDao.acceptOneFu(toUsername, "fu" + fuId);
        // 再进行合成判断和推送openid公众号
        if (code2 > 0) { // 成功收到赠送的福
            // 加福字成功
            String word = "";
            switch (fuId) {
            case 1:
                word = "燃";
                break;
            case 2:
                word = "情";
                break;
            case 3:
                word = "小";
                break;
            case 4:
                word = "站";
                break;
            default:
                break;
            }
            String pushText = fromUsername + " 赠送你一个福字：" + word;
            AccountModel account = weixinDao.getUserFusByUsername(toUsername);
            if (account != null) {
                int fu1 = account.getFu1();
                int fu2 = account.getFu2();
                int fu3 = account.getFu3();
                int fu4 = account.getFu4();
                int fu5 = account.getFu5();
                // 若4个福都有，则自动合成一个fu5
                if (fu1 > 0 && fu2 > 0 && fu3 > 0 && fu4 > 0 && fu5 < 1) {
                    int code3 = weixinDao.compoundOneFuByUsername(toUsername);
                    if (code3 > 0) {
                        pushText += ",并成功合成一个!";
                    }
                }
            }
            String toUserOpenid = toUser.getOpenid();
            // 获赠方openid不为空则推送到微信
            if (StringUtils.isNotEmpty(toUserOpenid)) {
                WeixinUtil.pushText(toUserOpenid, pushText);
            }
        }
        return CODE_SUCCESS;
    }
}
