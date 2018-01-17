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
}
