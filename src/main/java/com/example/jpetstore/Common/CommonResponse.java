package com.example.jpetstore.Common;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * @author Raymond Li
 * @create 2023-03-31 23:59
 * @description
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
public class CommonResponse {
    private int code;
    private Object data;

    /**
     * 成功
     */
    public static CommonResponse success(Object data) {
        return new CommonResponse(200, data);
    }

    /**
     * 失败
     */
    public static CommonResponse error(Object data) {
        return new CommonResponse(400, data);
    }

    /**
     * 没有token或token已过期
     */
    public static CommonResponse unauthorized(Object data) {
        return new CommonResponse(401, data);
    }
}
