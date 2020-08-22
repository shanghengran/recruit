package com.recruit.entity;
/**
 * 职位实体
 * @author Heng Ran Shang
 *
 */
public class JobEntity {
	//职位id（primary key）
	private int jid;
	//公司id
	private int fid;
	//职位名称
	private String jobName;
	//薪水
	private double pay;
	//工作经验要求
	private String reqExperience;
	//学历要求
	private String reqEducation;
	//公司福利
	private String attract;
	//职位描述
	private String description;
	//公司对象
	private FirmEntity firm;

	public FirmEntity getFirm() {
		return firm;
	}
	public void setFirm(FirmEntity firm) {
		this.firm = firm;
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
	public String getJobName() {
		return jobName;
	}
	public void setJobName(String jobName) {
		this.jobName = jobName;
	}
	public double getPay() {
		return pay;
	}
	public void setPay(double pay) {
		this.pay = pay;
	}
	public String getReqExperience() {
		return reqExperience;
	}
	public void setReqExperience(String reqExperience) {
		this.reqExperience = reqExperience;
	}
	public String getReqEducation() {
		return reqEducation;
	}
	public void setReqEducation(String reqEducation) {
		this.reqEducation = reqEducation;
	}
	public String getAttract() {
		return attract;
	}
	public void setAttract(String attract) {
		this.attract = attract;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	
}