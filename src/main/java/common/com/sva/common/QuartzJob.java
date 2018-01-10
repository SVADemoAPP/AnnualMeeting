package com.sva.common;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Map;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import com.sva.common.conf.Params;
import com.sva.dao.CommonDao;

public class QuartzJob {


    @Autowired
    private CommonDao dao;

    
    @Value("${reflashTime}")
    private String reflashTime;

    @Value("${mysql.db}")
    private String db;

    private static final Logger LOG = Logger.getLogger(QuartzJob.class);

    /** 
     * @Title: doCreateTable 
     * @Description: 动态创建位置数据表任务处理器  
     */
    public void doCreateTable() {
        // 今日表
        String tableName = Params.LOCATION + ConvertUtil.dateFormat(new Date(), Params.YYYYMMDD);
        // 明日表
        Calendar cal = Calendar.getInstance();
        cal.add(Calendar.DATE, 1);
        String time = ConvertUtil.dateFormat(cal.getTime(), Params.YYYYMMDD);
        String tableNameTommorrow = Params.LOCATION + time;
        LOG.info(db + ':' + tableName);
        String sqlDelete = "delete from allpeople";
        String sqlDelete1 = "delete from nowpeople";
        try {
            dao.doUpdate(sqlDelete);
            dao.doUpdate(sqlDelete1);
            // 如果今日表不存在则创建
            if (dao.isTableExist(tableName, db) < 1) {
                LOG.info("create table today:"+tableName);
                // 动态创建表
                dao.createTable(tableName);
            }
            // 如果明日表不存在则创建
            if (dao.isTableExist(tableNameTommorrow, db) < 1) {
                LOG.info("create table tommorrow:"+tableName);
                // 动态创建表
                dao.createTable(tableNameTommorrow);
            }
        } catch (Exception e) {
            LOG.error(e);
        }

    }

    public void doStatisticData() {
        long startTime = System.currentTimeMillis() - 3600000;
        Calendar cal = Calendar.getInstance();
        cal.add(Calendar.DATE, -1);
        String time = ConvertUtil.dateFormat(cal.getTime(), Params.YYYYMMDD);
        String tableName = Params.LOCATION + time;
        String sqlTest = "select count(*) from statisticday where time = '" + time + '\'';
        String sqlHour = "insert into statistichour "
                + "(SELECT b.placeId placeId,FROM_UNIXTIME(a.timestamp/1000,'%Y%m%d%H0000') time, "
                + "COUNT(distinct a.userID) number FROM "
                + tableName + " a join maps b on a.z = b.floorNo and a.timestamp> " + startTime
                + " GROUP BY b.placeId,time)";

        String sqlDay = "replace into statisticday " + "(SELECT b.placeId placeId,"
                + ConvertUtil.dateFormat(cal.getTime(), Params.YYYYMMDD) + " time,COUNT(distinct a.userID) number FROM "
                + tableName + " a join maps b on a.z = b.floorNo GROUP BY b.placeId)";

        String sqlFloor = "replace into statisticfloor "
                + "(SELECT userID, FROM_UNIXTIME(timestamp/1000,'%Y%m%d%H0000') time ,z FROM " + tableName
                + " group by userID,time,z) ";
        try {
            int result = dao.doTest(sqlTest);
            LOG.info(result);
            if (result == 0) {
                dao.doUpdate(sqlDay);
                dao.doUpdate(sqlHour);
                dao.doUpdate(sqlFloor);
            }
        } catch (Exception e) {
            LOG.error(e);
        }
    }

    public void doDeleteInfo() {
        Calendar calendar = Calendar.getInstance();
        SimpleDateFormat sdf = new SimpleDateFormat(Params.YYYYMMDD);
        calendar.add(Calendar.MONTH, -6);
        calendar.add(Calendar.DATE, -1);
        Date date = calendar.getTime();
        List<String> list = dao.doDeleteInfo("location" + sdf.format(date));
        int si = list.size();
        if (si > 0) {
            for (int i = 0; i < si; i++) {
                dao.deleteTable(list.get(i));
            }
        }
    }

    public void doStatisticOneHour() {
        Calendar cal = Calendar.getInstance();
        cal.add(Calendar.MINUTE, -1);
        String time = ConvertUtil.dateFormat(cal.getTime(), Params.YYYYMMDDHHMM) + "00";
        LOG.info(time);
        String tableName = Params.LOCATION + ConvertUtil.dateFormat(cal.getTime(), Params.YYYYMMDD);
        String sqlInsert = "insert into locationtemp(x,y,z,idType,dataType,timestamp,userID)"
                + "select a.x,a.y,a.z,a.idType,a.dataType,a.timestamp,a.userID from "
                + "(SELECT x,y,z,idType,dataType,timestamp,userID,"
                + "FROM_UNIXTIME(timestamp/1000,'%Y%m%d%H%i00') time FROM " 
                + tableName + " where FROM_UNIXTIME(timestamp/1000,'%Y%m%d%H%i00') = " + time
                + " GROUP BY userID,time) a;";

        cal.add(Calendar.HOUR, -1);
        time = ConvertUtil.dateFormat(cal.getTime(), Params.YYYYMMDDHHMM) + "00";
        LOG.info(time);
        LOG.info(sqlInsert);
        String sqlDelete = "delete from locationtemp " + "where FROM_UNIXTIME(timestamp/1000,'%Y%m%d%H%i00') < " + time;

        try {
            dao.doUpdate(sqlInsert);
            dao.doUpdate(sqlDelete);
        } catch (Exception e) {
            LOG.error(e);
        }

    }

    /** 
     * @Title: doStatisticDataPerHalfHour 
     * @Description: 每个小时按小时统计、按天统计、按楼层统计预处理    
     * @throws 
     */
    public void doStatisticDataPerHalfHour() {
        // 获取一个小时之前的时间戳
        long startTime = System.currentTimeMillis() - Params.ONE_HOUR;
        long insertTime = System.currentTimeMillis() - Params.HALF_HOUR;
        //获取前半个小时的小时时间
        String times = ConvertUtil.dateFormat(insertTime,Params.YYYYMMddHH00);
        //获取今天的日期时间
        String time = ConvertUtil.dateFormat(insertTime, Params.YYYYMMDD);
        String tableName = Params.LOCATION + time;
        LOG.info("doStatisticDataPerHalfHour:" + ConvertUtil.dateFormat(System.currentTimeMillis(), "yyyyMMddHHmmSS"));
        // 获取最近一小時各个商场的人流量
        String selectSqlHour = "SELECT b.placeId placeId,'"+times+"' time,COUNT(distinct a.userID) number "
                + "FROM " + tableName + " a join maps b on a.z = b.floorNo and a.timestamp> " + startTime
                + " GROUP BY b.placeId";
        // 获取当天各个商场的人流量
        String selectSqlDay = "SELECT b.placeId placeId,"
                + time + " time,COUNT(distinct a.userID) number "
                + "FROM " + tableName + " a join maps b on a.z = b.floorNo GROUP BY b.placeId";
        // 获取每个楼层、各个用户、每个小时的分布
        String selectSqlFloor = "SELECT userID, FROM_UNIXTIME(timestamp/1000,'%Y%m%d%H0000') time ,z " + "FROM " 
                + tableName + " group by userID,time,z";

        try {
            List<Map<String,Object>> selectSqlHourResult = dao.doTest1(selectSqlHour);
            String sqlHour = "insert into statistichour(placeId,time,number) values";
            if(!selectSqlHourResult.isEmpty()){
                for(Map<String,Object> m:selectSqlHourResult){
                    sqlHour += "('"+m.get("placeId")+ "','"+m.get("time")+"','"+m.get("number")+"'),";
                }
                sqlHour = sqlHour.substring(0, sqlHour.length()-1);
                dao.doUpdate(sqlHour);
            }
            
            List<Map<String,Object>> selectSqlDayResult = dao.doTest1(selectSqlDay);
            String sqlDay = "replace into statisticday(placeId,time,number) values";
            if(!selectSqlDayResult.isEmpty()){
                for(Map<String,Object> m:selectSqlDayResult){
                    sqlDay += "('"+m.get("placeId")+ "','"+m.get("time")+"','"+m.get("number")+"'),";
                }
                sqlDay = sqlDay.substring(0, sqlDay.length()-1);
                dao.doUpdate(sqlDay);
            }
            
            List<Map<String,Object>> selectSqlFloorResult = dao.doTest1(selectSqlFloor);
            String sqlFloor = "replace into statisticfloor(userID,time,z) values";
            if(!selectSqlFloorResult.isEmpty()){
                for(Map<String,Object> m:selectSqlFloorResult){
                    sqlFloor += "('"+m.get("userID")+ "','"+m.get("time")+"',"+m.get("z")+"),";
                }
                sqlFloor = sqlFloor.substring(0, sqlFloor.length()-1);
                dao.doUpdate(sqlFloor);
            }
            
        } catch (Exception e) {
            LOG.error(e);
        }

    }

    public void addLineStat() {
        long time = System.currentTimeMillis() - 30 * 60 * 1000;
        Calendar cal = Calendar.getInstance();
        String time2 = ConvertUtil.dateFormat(cal.getTime(), Params.YYYYMMDDHHMM) + "00";
        String tableName = Params.LOCATION + ConvertUtil.dateFormat(cal.getTime(), Params.YYYYMMDD);
        String sqlInsert = "insert into statisticlinetemp(number,time,placeId) "
                + "(select count(distinct a.userID) number," + time2 + " time,b.placeId from " + tableName
                + " a join maps b on a.z = b.floorNo where timestamp > " + time + " group by b.placeId)";
        LOG.info("addLineStat:" + sqlInsert);
        try {
            dao.doUpdate(sqlInsert);
        } catch (Exception e) {
            LOG.error(e);
        }
    }
}
