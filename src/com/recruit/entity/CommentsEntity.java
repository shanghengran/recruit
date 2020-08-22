package com.recruit.entity;
/**
 * 评论实体
 * @author Heng Ran Shang
 *
 */
public class CommentsEntity {
	//评论id（primary key）
	private int cid;
	//用户id
	private int uid;
	//公司id
	private int fid;
	//工作id
	private int jid;
	//评论内容
	private String content;
	//评论时间
	private String sendTime;
	//评论人对象
	private UserEntity user;
	
	public UserEntity getUser() {
		return user;
	}
	public void setUser(UserEntity user) {
		this.user = user;
	}
	public String getSendTime() {
		return sendTime;
	}
	public void setSendTime(String sendTime) {
		this.sendTime = sendTime;
	}
	public int getCid() {
		return cid;
	}
	public void setCid(int cid) {
		this.cid = cid;
	}
	public int getUid() {
		return uid;
	}
	public void setUid(int uid) {
		this.uid = uid;
	}
	public int getFid() {
		return fid;
	}
	public void setFid(int fid) {
		this.fid = fid;
	}
	public int getJid() {
		return jid;
	}
	public void setJid(int jid) {
		this.jid = jid;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	
}
