package com.recruit.entity;
/**
 * AJAX 返回实体
 * @author Heng Ran Shang
 *
 * @param <T>
 */
public class Result<T> {
	//状态	0 代表成功 1代表失败
	private int state;
	//原因
	private String msg;
	//泛型
	private T t;

	public int getState() {
		return state;
	}

	public void setState(int state) {
		this.state = state;
	}

	public String getMsg() {
		return msg;
	}

	public void setMsg(String msg) {
		this.msg = msg;
	}

	public T getT() {
		return t;
	}

	public void setT(T t) {
		this.t = t;
	}
	
	
}
