package com.example.jpetstore.POJO.MapStruct;

import com.example.jpetstore.POJO.DataObject.UserAuthDO;
import com.example.jpetstore.POJO.ViewObject.UserVO;
import org.mapstruct.Mapper;
import org.mapstruct.Mapping;

/**
 * @author Raymond Li
 * @create 2023-03-21 10:22
 * @description
 */
@Mapper(componentModel = "spring")
public interface UserMapping {
    /**
     * 将UserVO转为UserAuthDO
     */
    @Mapping(target = "account", source = "username")
    @Mapping(target = "password", source = "password")
    public UserAuthDO toUserAuthDO(UserVO userVO);
}
