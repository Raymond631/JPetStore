package com.example.jpetstore.POJO;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.data.annotation.AccessType;

import java.util.Date;

/**
 * @author Raymond Li
 * @create 2023-06-14 10:49
 * @description
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
public class AccessLog {
    //访问者用户名
    private String username;
    //请求路径
    private String url;
    //请求消耗时长
    private Integer duration;
    //http 方法：GET、POST等
    private String httpMethod;
    //http 请求响应状态码
    private Integer httpStatus;
    //访问者ip
    private String ip;
    //此条记录的创建时间
    private Date createTime;
}
