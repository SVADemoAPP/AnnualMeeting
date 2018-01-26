/**   
 * @Title: WinningRecordDao.java 
 * @Package com.sva.dao 
 * @Description: 获奖数据Dao
 * @author labelCS   
 * @date 2018年1月16日 下午4:39:34 
 * @version V1.0   
 */
package com.sva.dao;

import java.util.List;
import org.apache.ibatis.annotations.Param;
import com.sva.model.DeptRateModel;
import com.sva.model.PrizeModel;
import com.sva.model.WinningRecordModel;

/** 
 * @ClassName: WinningRecordDao 
 * @Description: 获奖数据Dao
 * @author labelCS 
 * @date 2018年1月16日 下午4:39:34 
 *  
 */
public interface WinningRecordDao
{
    /** 
     * @Title: getDeptRate 
     * @Description: 获取各部门对应获奖等级的获奖概率 
     * @param prizeCode
     * @return 
     */
    public List<DeptRateModel> getDeptRate(String prizeCode);
    
    /** 
     * @Title: updateDeptRate 
     * @Description: 更新各部门对应获奖等级的获奖概率 
     * @param deptRate
     * @param prizeCode 
     */
    public void updateDeptRate(@Param("deptRate")DeptRateModel deptRate);
    
    /** 
     * @Title: getPrizeCountByCode 
     * @Description: 获取指定等级的奖品总数 
     * @param prizeCode
     * @return 
     */
    public Integer getPrizeCountByCode(String prizeCode);
    
    /** 
     * @Title: getReceivedPrizeCountByCode 
     * @Description: 获取指定等级已领取的奖品数量
     * @param prizeCode
     * @return 
     */
    public Integer getReceivedPrizeCountByCode(String prizeCode);
    
    /** 
     * @Title: getPrizeDetail 
     * @Description: 获取指定等级的奖品详情 
     * @param prizeCode
     * @return 
     */
    public PrizeModel getPrizeDetail(String prizeCode);
    
    /** 
     * @Title: saveWinningRecord 
     * @Description: 将中奖信息记录到数据库 
     * @param model 
     */
    public void saveWinningRecord(WinningRecordModel model);
    
    /** 
     * @Title: getAllPrizeDetail 
     * @Description: 获取所有的奖品信息 
     * @return 
     */
    public List<PrizeModel> getAllPrizeDetail();
    
    /** 
     * @Title: getAllWinRecord 
     * @Description: 获取所有的中奖信息 
     * @return 
     */
    public List<WinningRecordModel> getAllWinRecord();
    
    /** 
     * @Title: getWinInfoByAccount 
     * @Description: 获取指定账户的中奖信息 
     * @param accountId
     * @return 
     */
    public List<WinningRecordModel> getWinInfoByAccount(String accountId);
}
