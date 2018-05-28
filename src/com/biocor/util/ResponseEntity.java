package com.biocor.util;

public class ResponseEntity<T> {

    /**
     * state ：状态 date : 数据
     */
    private Integer state;
    private String msg;
    private T data;

    public String getMsg() {
        return msg;
    }

    public ResponseEntity<T> setMsg(String msg) {
        this.msg = msg;
        return this;
    }

    public int getState() {
        return state;
    }

    public ResponseEntity<T> setState(Integer state) {
        this.state = state;
        return this;
    }

    public T getData() {
        return data;
    }

    public ResponseEntity<T> setData(T data) {
        this.data = data;
        return this;
    }
}