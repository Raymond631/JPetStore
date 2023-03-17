package com.zlp.jpetstore_spring.common;

import org.springframework.validation.BindException;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RestControllerAdvice;

/**
 * @author Raymond Li
 * @create 2023-03-17 18:38
 * @description
 */
@RestControllerAdvice
public class ValidExceptionHandler {
    @ExceptionHandler(BindException.class)
    public String validExceptionHandler(BindException exception) {
        return exception.getAllErrors().get(0).getDefaultMessage();
    }
}
