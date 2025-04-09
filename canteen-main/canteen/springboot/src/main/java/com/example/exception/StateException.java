package com.example.exception;

public class StateException extends RuntimeException {
  private String msg;

  public StateException(String msg) {
    this.msg = msg;
  }

  public String getMsg() {
    return msg;
  }

  public void setMsg(String msg) {
    this.msg = msg;
  }
}
