package com.example.jpetstore;

import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.web.servlet.support.SpringBootServletInitializer;

/**
 * @author Raymond Li
 * @create 2023-06-12 12:29
 * @description
 */
public class JPetStoreServletInitializer extends SpringBootServletInitializer {
    @Override
    protected SpringApplicationBuilder configure(SpringApplicationBuilder application)
    {
        return application.sources(JPetstoreApplication.class);
    }
}
