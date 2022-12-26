package cn.tdsmy.JPetStore.Entity;

import java.io.Serializable;

/**
 * @Author: Raymond Li
 * @Date: 2022/11/4 20:51
 * @Version 1.0
 */
public class UserLog implements Serializable
{
    private static final long serialVersionUID = -1708018176084977814L;

    private String username;
    private String time;
    private String ip;
    private String url;
    private String sqlType;
    private String operationContent;
    private String status;

    public UserLog(String username, String time, String ip, String url, String sqlType, String operationContent, String status)
    {
        this.username = username;
        this.time = time;
        this.ip = ip;
        this.url = url;
        this.sqlType = sqlType;
        this.operationContent = operationContent;
        this.status = status;
    }

    public UserLog()
    {
    }

    public String getUsername()
    {
        return username;
    }

    public void setUsername(String username)
    {
        this.username = username;
    }

    public String getTime()
    {
        return time;
    }

    public void setTime(String time)
    {
        this.time = time;
    }

    public String getIp()
    {
        return ip;
    }

    public void setIp(String ip)
    {
        this.ip = ip;
    }

    public String getUrl()
    {
        return url;
    }

    public void setUrl(String url)
    {
        this.url = url;
    }

    public String getSqlType()
    {
        return sqlType;
    }

    public void setSqlType(String sqlType)
    {
        this.sqlType = sqlType;
    }

    public String getOperationContent()
    {
        return operationContent;
    }

    public void setOperationContent(String operationContent)
    {
        this.operationContent = operationContent;
    }

    public String getStatus()
    {
        return status;
    }

    public void setStatus(String status)
    {
        this.status = status;
    }
}
