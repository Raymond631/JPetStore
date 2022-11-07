package cn.tdsmy.JPetStore.Service;

import cn.tdsmy.JPetStore.Entity.UserLog;

import java.util.List;

/**
 * @Author: Raymond Li
 * @Date: 2022/11/4 20:54
 * @Version 1.0
 */
public interface LogService
{
    public void addLog(UserLog userLog);

    public List<UserLog> getLog();
}
