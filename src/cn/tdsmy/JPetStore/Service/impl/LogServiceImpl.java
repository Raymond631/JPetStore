package cn.tdsmy.JPetStore.Service.impl;

import cn.tdsmy.JPetStore.Dao.LogDao;
import cn.tdsmy.JPetStore.Dao.impl.LogDaoImpl;
import cn.tdsmy.JPetStore.Entity.UserLog;
import cn.tdsmy.JPetStore.Service.LogService;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * @Author: Raymond Li
 * @Date: 2022/11/4 20:56
 * @Version 1.0
 */
public class LogServiceImpl implements LogService
{
    private LogDao logDao;

    @Override
    public void addLog(HttpServletRequest req, String sqlType, String operationContent, String status)
    {
        if (logDao == null)
        {
            logDao = new LogDaoImpl();
        }
        UserLog userLog = (UserLog) req.getAttribute("myLog");//日志
        
        userLog.setSqlType(sqlType);
        userLog.setOperationContent(operationContent);
        userLog.setStatus(status);

        logDao.addLog(userLog);
    }

    @Override
    public List<UserLog> getLog()
    {
        if (logDao == null)
        {
            logDao = new LogDaoImpl();
        }
        return logDao.getLog();
    }
}
