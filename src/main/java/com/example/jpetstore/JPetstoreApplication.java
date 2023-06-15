package com.example.jpetstore;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.web.servlet.support.SpringBootServletInitializer;

@SpringBootApplication
public class JPetstoreApplication extends SpringBootServletInitializer {
    /**
     * jar包部署
     */
    public static void main(String[] args) {
        SpringApplication.run(JPetstoreApplication.class, args);
    }

    /**
     * war包部署
     */
    @Override
    protected SpringApplicationBuilder configure(SpringApplicationBuilder application) {
        return application.sources(JPetstoreApplication.class);
    }
}
