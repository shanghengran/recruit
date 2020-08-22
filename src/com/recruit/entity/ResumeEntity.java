package com.recruit.entity;
/**
 * 简历实体
 * @author Heng Ran Shang
 *
 */
public class ResumeEntity {
	//简历id（primary key）
	private int rid;
	//用户id
	private int uid;
	//真实姓名
	private String realName;
	//性别
	private String gender;
	//年龄
	private int age;
	//手机号
	private String phone;
	//教育程度
	private String education;
	//工作经验
	private String experience;
	//求职意向
	private String intention;
	//期望薪资
	private double salary;
	//个人简介
	private String introduction;
	//简历附件
	private String rFile;
	//工作对象
	private JobEntity job;
	
	public JobEntity getJob() {
		return job;
	}
	public void setJob(JobEntity job) {
		this.job = job;
	}
	public int getRid() {
		return rid;
	}
	public void setRid(int rid) {
		this.rid = rid;
	}
	public String getRealName() {
		return realName;
	}
	public void setRealName(String realName) {
		this.realName = realName;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getEducation() {
		return education;
	}
	public void setEducation(String education) {
		this.education = education;
	}
	public String getExperience() {
		return experience;
	}
	public void setExperience(String experience) {
		this.experience = experience;
	}
	public String getIntention() {
		return intention;
	}
	public void setIntention(String intention) {
		this.intention = intention;
	}
	public double getSalary() {
		return salary;
	}
	public void setSalary(double salary) {
		this.salary = salary;
	}
	public String getIntroduction() {
		return introduction;
	}
	public void setIntroduction(String introduction) {
		this.introduction = introduction;
	}
	public String getrFile() {
		return rFile;
	}
	public void setrFile(String rFile) {
		this.rFile = rFile;
	}
	public int getUid() {
		return uid;
	}
	public void setUid(int uid) {
		this.uid = uid;
	}
	
	
}
