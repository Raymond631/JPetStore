package cn.tdsmy.JPetStore.Controller;

import cn.tdsmy.JPetStore.Entity.User;
import cn.tdsmy.JPetStore.Entity.UserLog;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * @Author: Raymond Li
 * @Date: 2022/10/25 18:50
 * @Version 1.0
 */

@WebFilter(urlPatterns = {"/*"})
public class LogFilter implements javax.servlet.Filter {
    /**
     * req.getRequestURL()    //完整请求路径,包括IP地址和端口号，如http://localhost:8080/JPetStore_war_exploded/
     * req.getRemoteAddr()    //获取客户端IP地址,如127.0.0.1
     * req.getRequestURI()    //相对请求路径,不包括IP地址和端口号,如/JPetStore_war_exploded/Cart/cartList
     * req.getContextPath();  //web应用根路径，如/JPetStore_war_exploded
     * req.getServletPath();  //servlet映射路径，如/Cart
     * req.getPathInfo();     //与getServletPath()获取的路径互补，能得到模糊匹配*的路径部分 ，如/cartList
     */
    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        servletRequest.setCharacterEncoding("UTF-8");
        servletResponse.setCharacterEncoding("UTF-8");
        HttpServletRequest req = (HttpServletRequest) servletRequest;
        HttpServletResponse resp = (HttpServletResponse) servletResponse;

        //1、用户名
        User user = (User) req.getSession().getAttribute("user");
        String username;
        if (user == null) {
            username = "游客";
        }
        else {
            username = user.getUsername();
        }

        //2、请求时间
        String time = getTimeNow();

        //3、客户端IP
        String ip = req.getRemoteAddr();
        if (ip.equals("0:0:0:0:0:0:0:1"))//将localhost的IPv6地址转为IPv4地址
        {
            ip = "127.0.0.1";
        }

        //4、请求路径
        String url = req.getRequestURI();

        UserLog userLog = new UserLog();
        userLog.setUsername(username);
        userLog.setTime(time);
        userLog.setIp(ip);
        userLog.setUrl(url);

        req.setAttribute("myLog", userLog);
        filterChain.doFilter(servletRequest, servletResponse);
    }

    public String getTimeNow() {
        Date date = new Date();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        return sdf.format(date);
    }
}
