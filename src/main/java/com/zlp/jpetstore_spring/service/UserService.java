package com.zlp.jpetstore_spring.service;

import com.zlp.jpetstore_spring.entity.User;

/**
 * @author Raymond Li
 * @create 2023-03-07 22:12
 * @description
 */
public interface UserService {
    public boolean login(User user);
}