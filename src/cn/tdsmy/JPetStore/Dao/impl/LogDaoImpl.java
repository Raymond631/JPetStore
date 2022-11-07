package cn.tdsmy.JPetStore.Dao.impl;

import cn.tdsmy.JPetStore.Dao.LogDao;
import cn.tdsmy.JPetStore.Dao.Utils.DBUtils;
import cn.tdsmy.JPetStore.Entity.UserLog;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 * @Author: Raymond Li
 * @Date: 2022/11/4 20:57
 * @Version 1.0
 */
public class LogDaoImpl implements LogDao
{
    @Override
    public void addLog(UserLog userLog)
    {
        String value = "'" + userLog.getUsername() + "','" + userLog.getTime() + "','" + userLog.getIp() + "','" + userLog.getUrl() + "','"
                + userLog.getSqlType() + "','" + userLog.getOperationContent() + "','" + userLog.getStatus() + "'";
        String sql = "insert into userlogs (username,time,ip,url,sqlType,operationContent,status) values (" + value + ")";
        try (Connection connection = DBUtils.getConnection(); PreparedStatement statement = connection.prepareStatement(sql))
        {
            statement.executeUpdate();
        }
        catch (SQLException e)
        {
            throw new RuntimeException(e);
        }
    }

    @Override
    public List<UserLog> getLog()
    {
        List<UserLog> userLogList = new ArrayList<>();
        String sql = "select * from userlogs";
        try (Connection connection = DBUtils.getConnection(); PreparedStatement statement = connection.prepareStatement(sql); ResultSet res = statement.executeQuery(sql))
        {
            while (res.next())
            {
                String username = res.getString("username");
                String time = res.getString("time");
                String ip = res.getString("ip");
                String url = res.getString("url");
                String sqlType = res.getString("sqlType");
                String operationContent = res.getString("operationContent");
                String status = res.getString("status");
                UserLog userLog = new UserLog(username, time, ip, url, sqlType, operationContent, status);
                userLogList.add(userLog);
            }
        }
        catch (SQLException e)
        {
            throw new RuntimeException(e);
        }
        return userLogList;
    }
}
