package cn.tdsmy.JPetStore.Service;

import cn.tdsmy.JPetStore.Entity.UserLog;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * @Author: Raymond Li
 * @Date: 2022/11/4 20:54
 * @Version 1.0
 */
public interface LogService
{
    public void addLog(HttpServletRequest req, String sqlType, String operationContent, String status);

    public List<UserLog> getLog();
}
