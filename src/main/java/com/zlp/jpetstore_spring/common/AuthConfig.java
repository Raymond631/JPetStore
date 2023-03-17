package com.zlp.jpetstore_spring.common;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

/**
 * @author Raymond Li
 * @create 2023-03-15 22:22
 * @description
 */
@Configuration
public class AuthConfig implements WebMvcConfigurer {
    /**
     * 注册拦截器
     * addPathPatterns为拦截路径
     * excludePathPatterns为从拦截路径中排除的路径
     * @param registry
     */
    @Override
    public void addInterceptors(InterceptorRegistry registry) {
        registry.addInterceptor(new AuthInterceptor()).addPathPatterns("/**")
                .excludePathPatterns("/image/**","/css/**","/js/**",
                        "/","/Error/NotLogin.html",
                        "/User/Login.html","/User/Register.html",
                        "/Pet/Index.html","/Pet/Details.html","/Pet/Search.html");
    }
}
