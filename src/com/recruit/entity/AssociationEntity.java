package com.recruit.entity;
/**
 * 简历状态实体
 * @author Heng Ran Shang
 *
 */
public class AssociationEntity {
	//关联id（primary key）
	private int aid;
	//简历id
	private int rid;
	//职位id
	private int jid;
	//公司id
	private int fid;
	//已查看
	private int isView = 0;
	//感兴趣
	private int isInterest = 0;
	//可面试
	private int isInterviewBefore = 0;
	//已面试
	private int isInterviewAfter = 0;
	//该简历的申请职位名
	private String jobName;
	//该简历的申请公司名
	private String firmName;
	
	public String getJobName() {
		return jobName;
	}
	public void setJobName(String jobName) {
		this.jobName = jobName;
	}
	public String getFirmName() {
		return firmName;
	}
	public void setFirmName(String firmName) {
		this.firmName = firmName;
	}
	public int getAid() {
		return aid;
	}
	public void setAid(int aid) {
		this.aid = aid;
	}
	public int getRid() {
		return rid;
	}
	public void setRid(int rid) {
		this.rid = rid;
	}
	public int getJid() {
		return jid;
	}
	public void setJid(int jid) {
		this.jid = jid;
	}
	
	public int getFid() {
		return fid;
	}
	public void setFid(int fid) {
		this.fid = fid;
	}
	public int getIsView() {
		return isView;
	}
	public void setIsView(int isView) {
		this.isView = isView;
	}
	public int getIsInterest() {
		return isInterest;
	}
	public void setIsInterest(int isInterest) {
		this.isInterest = isInterest;
	}
	public int getIsInterviewBefore() {
		return isInterviewBefore;
	}
	public void setIsInterviewBefore(int isInterviewBefore) {
		this.isInterviewBefore = isInterviewBefore;
	}
	public int getIsInterviewAfter() {
		return isInterviewAfter;
	}
	public void setIsInterviewAfter(int isInterviewAfter) {
		this.isInterviewAfter = isInterviewAfter;
	}
	
}
