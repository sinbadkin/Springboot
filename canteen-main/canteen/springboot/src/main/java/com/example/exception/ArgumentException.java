package com.example.exception;

public class ArgumentException extends RuntimeException {
    private String msg;

    public ArgumentException(String msg) {
        this.msg = msg;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }
}
