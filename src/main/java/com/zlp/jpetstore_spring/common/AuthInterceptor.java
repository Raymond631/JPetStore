package com.zlp.jpetstore_spring.common;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.servlet.HandlerInterceptor;

/**
 * @author Raymond Li
 * @create 2023-03-08 8:40
 * @description
 */

@Slf4j
public class AuthInterceptor implements HandlerInterceptor {
    /**
     * 登录验证拦截器
     * @param request
     * @param response
     * @param handler
     * @return
     * @throws Exception
     */
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        log.info(request.getRemoteAddr()+"的用户访问了"+ request.getRequestURL());
        Object loginUser = request.getSession().getAttribute("loginUser");
        if(loginUser!=null){
            return true;
        }
        //未登录
        response.sendRedirect("/jpetstore/Error/NotLogin.html");
        return true;
    }
}
