package com.zlp.jpetstore_spring.service.impl;

import com.zlp.jpetstore_spring.entity.User;
import com.zlp.jpetstore_spring.mapper.UserMapper;
import com.zlp.jpetstore_spring.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * @author Raymond Li
 * @create 2023-03-07 22:14
 * @description
 */
@Service
public class UserServiceImpl implements UserService {
    @Autowired
    private UserMapper userMapper;

    @Override
    public boolean loign(User user) {
        if(userMapper.selectUser(user)==null){
            return false;
        }
        else{
            return true;
        }
    }
}
