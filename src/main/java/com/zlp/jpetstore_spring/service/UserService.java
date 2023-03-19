package com.zlp.jpetstore_spring.service;

import com.zlp.jpetstore_spring.entity.Receiver;
import com.zlp.jpetstore_spring.entity.User;

import java.util.List;

/**
 * @author Raymond Li
 * @create 2023-03-07 22:12
 * @description
 */
public interface UserService {
    public boolean login(User user);

    void updateReceiver(String userId, List<Receiver> receiverList);
}