/**   
 * @Title: LotteryService.java 
 * @Package com.sva.service 
 * @Description: 抽奖业务逻辑
 * @author labelCS   
 * @date 2018年1月15日 上午11:24:01 
 * @version V1.0   
 */
package com.sva.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Random;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import com.sva.dao.AccountDao;
import com.sva.dao.WinningRecordDao;
import com.sva.model.AccountModel;
import com.sva.model.DeptRateModel;

/** 
 * @ClassName: LotteryService 
 * @Description: 抽奖业务逻辑
 * @author labelCS 
 * @date 2018年1月15日 上午11:24:01 
 *  
 */
@Service
public class LotteryService
{
    @Autowired
    AccountDao daoAccount;
    
    @Autowired
    WinningRecordDao daoWinning;
    
    /** 
     * @Fields fullRate : 概率和 
     */ 
    @Value("${rate.fullRate}")
    int fullRate;
    
    /** 
     * @Fields percent : 中奖一次后，概率下降值 
     */ 
    @Value("${rate.percent}")
    int percent;
    
    /** 
     * @Title: getWinningEmployee 
     * @Description: 获取中奖人信息 
     * @param prizeLevel
     * @return 
     */
    public AccountModel getWinningEmployee(String prizeLevel){
        // 各部门当前获奖概率
        List<DeptRateModel> deptRate = daoWinning.getDeptRate(prizeLevel);
        // 根据各部门获奖概率，抽取获奖部门
        String dept = getWinningDept(deptRate);
        // 抽取获奖部门的幸运工号
        AccountModel winningPerson = getWinningPerson(prizeLevel, dept);
        // 计算各部门新的获奖概率
        calcNewDeptRate(deptRate, dept);
        // 返回工号
        return winningPerson;
    }
    
    /** 
     * @Title: getRemainPrizeCount 
     * @Description: 获取指定奖品剩余的额度 
     * @param prizeLevel
     * @return 
     */
    public Integer getRemainPrizeCount(String prizeLevel){
        // 获取该等级奖品总数
        int all = daoWinning.getPrizeCountByCode(prizeLevel);
        // 获取该等级已领走奖品数
        int received = daoWinning.getReceivedPrizeCountByCode(prizeLevel);
        // 返回剩余奖品数
        return all - received;
    }
    
    /** 
     * @Title: getWinningDept 
     * @Description: 根据各部门获奖概率，抽取获奖部门
     * @param deptRate
     * @return 
     */
    private String getWinningDept(List<DeptRateModel> deptRate){
        // 返回值
        String deptName = "";
        // 创建各部门随机数区间
        List<Integer> rateList = new ArrayList<Integer>();
        for(DeptRateModel d:deptRate){
            Integer r = d.getRate();
            if(rateList.size()>0){
                rateList.add(rateList.get(rateList.size() - 1) + r);
            }else{
                rateList.add(r);
            }
        }
        // 获取一个随机数
        Random random = new Random();
        int ranNumber = random.nextInt(fullRate) + 1;
        // 判断随机数属于哪一个部门
        for(int i=0; i<rateList.size(); i++){
            if(ranNumber <= rateList.get(i)){
                deptName = deptRate.get(i).getDept();
                break;
            }
        }
        
        return deptName;
    }
    
    /** 
     * @Title: getWinningPerson 
     * @Description: 抽取获奖部门的幸运工号
     * @param prizeLevel
     * @param winningDept
     * @return 
     */
    private AccountModel getWinningPerson(String prizeLevel, String winningDept){
        // 抽奖候选人名单
        List<Integer> personList = daoAccount.getCandidate(winningDept, prizeLevel);
        // 获取随机数
        Random random = new Random();
        int ranNumber = random.nextInt(personList.size());
        // 返回获奖者
        return daoAccount.getPersionById(personList.get(ranNumber));
    }
    
    /** 
     * @Title: calcNewDeptRate 
     * @Description: 计算各部门新的获奖概率,并更新数据库 
     * @param deptRate
     * @param prizeLevel
     */
    private void calcNewDeptRate(List<DeptRateModel> deptRate, String winningDept){
        // 找到获奖部门，确定获奖部门新的获奖概率下降数量
        int downRate = percent;
        int i = 0;
        for(; i<deptRate.size(); i++){
            DeptRateModel d = deptRate.get(i);
            if(d.getDept().equals(winningDept)){
                int rateOld = d.getRate();
                if(rateOld < percent){
                    downRate = rateOld;
                }
                break;
            }
        }
        // 获奖部门下降的概率补给其他部门，并更新数据库
        int avgAdd = downRate/(deptRate.size()-1);
        boolean flag = true;
        for(int j=0; j<deptRate.size(); j++){
            DeptRateModel temp = deptRate.get(j);
            if(j == i){
                temp.setRate(temp.getRate() - downRate);
            }else if(flag){
                // 确保所有部门概率之和等于fullRate
                int offset = downRate - avgAdd * (deptRate.size()-1);
                temp.setRate(temp.getRate() + avgAdd + offset);
                flag = false;
            }else{
                temp.setRate(temp.getRate() + avgAdd);
            }
            // 更新数据库
            daoWinning.updateDeptRate(temp);
        }
    }
}
