package cn.tdsmy.JPetStore.Service;

import cn.tdsmy.JPetStore.Entity.Profile;
import cn.tdsmy.JPetStore.Entity.Receiver;
import cn.tdsmy.JPetStore.Entity.User;

/**
 * @Author:liliyyyyy
 * @Date: 2022/10/27 19:59
 * @Version 1.0
 */
public interface UserService {
    public boolean login(User user);

    public boolean register(User user);

    public boolean registerSuccess(User user);

    public Receiver getReceiver(String username);

    public Profile getProfile(String username);


    public void changePassword(User user);

    public void updateReceiver(String username, Receiver receiver);

    public void updateProfile(String username, Profile profile);
}
