package com.zlp.jpetstore_spring.mapper;

import com.zlp.jpetstore_spring.entity.Receiver;
import com.zlp.jpetstore_spring.entity.User;
import org.apache.ibatis.annotations.Mapper;

/**
 * @author Raymond Li
 * @create 2023-03-07 22:17
 * @description
 */
@Mapper
public interface UserMapper {
    User selectUser(User user);

    void deleteOldReceiver(String userId);

    void insertNewReceiver(Receiver receiver);
}
