package com.recruit.entity;
/**
 * 用户实体
 * @author Heng Ran Shang
 *
 */
public class UserEntity {
	//用户id（primary key）
	private int uid;
	//用户照片
	private String photo;
	//用户名
	private String username;
	//密码
	private String password;
	//用户类型（个人，公司）
	private String type;
	
	public int getUid() {
		return uid;
	}
	public void setUid(int uid) {
		this.uid = uid;
	}
	public String getPhoto() {
		return photo;
	}
	public void setPhoto(String photo) {
		this.photo = photo;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	
}
