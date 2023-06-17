package com.example.jpetstore.Common;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

/**
 * 对/image/look/**的资源访问均映射到D:/jpetstoreImage/文件夹
 */
@Configuration
public class FilePathMapConfig implements WebMvcConfigurer {
    private static final String staticResourcePath = "/image/look/**";
    private static final String mapToLocalPath = "file:/home/raymond/PetImage/";

    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
        registry.addResourceHandler(staticResourcePath).addResourceLocations(mapToLocalPath);
    }

    @Override
    public void addInterceptors(InterceptorRegistry registry) {
        registry.addInterceptor(new AccessLogInterceptor()).addPathPatterns("/**").excludePathPatterns(staticResourcePath);
    }
}