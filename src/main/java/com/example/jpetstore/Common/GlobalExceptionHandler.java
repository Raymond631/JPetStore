package com.example.jpetstore.Common;

import io.jsonwebtoken.JwtException;
import lombok.extern.slf4j.Slf4j;
import org.springframework.validation.BindException;
import org.springframework.web.bind.MissingRequestCookieException;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RestControllerAdvice;

/**
 * @author Raymond Li
 * @create 2023-03-31 23:59
 * @description
 */
@Slf4j
@RestControllerAdvice
public class GlobalExceptionHandler {

    @ExceptionHandler(Exception.class)
    public CommonResponse exceptionHandler(Exception e) {
        log.error(e.getClass() + " | " + e.getMessage());
        return CommonResponse.error(e.getMessage());
    }

    @ExceptionHandler(JwtException.class)
    public CommonResponse jwtExceptionHandler(Exception e) {
        log.error(e.getMessage());
        return CommonResponse.unauthorized(e.getMessage());
    }

    @ExceptionHandler(MissingRequestCookieException.class)
    public CommonResponse validExceptionHandler(MissingRequestCookieException e) {
        log.error(e.getMessage());
        return CommonResponse.unauthorized("请先登录");
    }

    @ExceptionHandler(BindException.class)
    public CommonResponse validExceptionHandler(BindException e) {
        log.error(e.getMessage());
        return CommonResponse.error(e.getAllErrors().get(0).getDefaultMessage());
    }
}

