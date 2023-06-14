package com.example.jpetstore;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cache.annotation.EnableCaching;

@SpringBootApplication
public class JPetstoreApplication {
    public static void main(String[] args) {
        SpringApplication.run(JPetstoreApplication.class, args);
    }
}
