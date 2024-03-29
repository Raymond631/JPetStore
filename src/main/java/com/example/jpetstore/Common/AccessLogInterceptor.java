package com.example.jpetstore.Common;

import com.example.jpetstore.POJO.AccessLog;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.servlet.HandlerInterceptor;

import java.util.Date;

/**
 * @author Raymond Li
 * @create 2023-06-14 10:50
 * @description
 */
@Slf4j
public class AccessLogInterceptor implements HandlerInterceptor {
    //请求开始时间标识
    private static final String LOGGER_SEND_TIME = "SEND_TIME";
    //请求日志实体标识
    private static final String LOGGER_ACCESSLOG = "ACCESSLOG_ENTITY";

    /**
     * 进入SpringMVC的Controller之前开始记录日志实体
     */
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object o) throws Exception {

        //创建日志实体
        AccessLog accessLog = new AccessLog();

        // 设置IP地址
        accessLog.setIp(AdrressIpUtils.getIpAdrress(request));

        //设置请求方法,GET,POST...
        accessLog.setHttpMethod(request.getMethod());

        //设置请求路径
        accessLog.setUrl(request.getRequestURI());

        //设置请求开始时间
        request.setAttribute(LOGGER_SEND_TIME,System.currentTimeMillis());

        //设置请求实体到request内，方便afterCompletion方法调用
        request.setAttribute(LOGGER_ACCESSLOG,accessLog);
        return true;
    }


    @Override
    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object o, Exception e) throws Exception {

        //获取本次请求日志实体
        AccessLog accessLog = (AccessLog) request.getAttribute(LOGGER_ACCESSLOG);

        //获取请求错误码，根据需求存入数据库，这里不保存
        int status = response.getStatus();
        accessLog.setHttpStatus(status);

        //设置访问者(这里暂时写死）
        // 因为不同的应用可能将访问者信息放在session里面，有的通过request传递，
        // 总之可以获取到，但获取的方法不同
        String nickname = "游客";
        Cookie[] cookies = request.getCookies();
        if(cookies != null){
            for (Cookie cookie : cookies) {
                if (cookie.getName().equals("token")) {
                    nickname = (String) JwtUtil.resolveToken(cookie.getValue()).get("nickname");
                }
            }
        }
        accessLog.setUsername(nickname);

        //当前时间
        long currentTime = System.currentTimeMillis();

        //请求开始时间
        long snedTime = Long.parseLong(request.getAttribute(LOGGER_SEND_TIME).toString());


        //设置请求时间差
        accessLog.setDuration(Integer.valueOf((currentTime - snedTime)+""));

        accessLog.setCreateTime(new Date());
        //将sysLog对象持久化保存
        log.info(accessLog.toString());
    }
}
