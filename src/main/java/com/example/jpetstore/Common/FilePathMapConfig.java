package com.example.jpetstore.Common;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

/**
 * 对/image/look/**的资源访问均映射到D:/jpetstoreImage/文件夹
 */
@Configuration
public class FilePathMapConfig implements WebMvcConfigurer {
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
        registry.addResourceHandler("/image/look/**").addResourceLocations("file:D:/jpetstoreImage/");
    }
}