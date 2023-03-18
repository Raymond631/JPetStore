package com.zlp.jpetstore_spring;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
@MapperScan("com.zlp.jpetstore_spring.mapper")
public class JPetStoreSpringApplication {

    public static void main(String[] args) {
        SpringApplication.run(JPetStoreSpringApplication.class, args);
    }

}
