package com.zlp.jpetstore_spring;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import java.util.UUID;

/**
 * @author Raymond Li
 * @create 2023-03-15 22:02
 * @description
 */
@RunWith(SpringRunner.class)
@SpringBootTest
public class commonTest {
    @Test
    public void abc(){
        System.out.println(UUID.randomUUID());
    }
}
