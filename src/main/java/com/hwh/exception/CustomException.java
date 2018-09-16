package com.hwh.exception;

/**
 * 功能描述：
 *
 * @Author houwenhua
 * @Date 2018/9/15 23:12
 */
public class CustomException extends Exception {
    private String message;

    public CustomException(String message) {
        super();
        this.message = message;
    }

    @Override
    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }
}
