package com.recruit.entity;

/**
 * 公司实体
 * @author Heng Ran Shang
 *
 */
public class FirmEntity {
	//公司id（primary key）
	private int fid;
	//公司图标
	private String logo;
	//公司名称
	private String firmName;
	//公司地点
	private String place;
	//公司电话
	private String tel;
	//公司负责人
	private String manager;
	//公司简介
	private String profile;
	//公司附件
	private String fFile;

	public int getFid() {
		return fid;
	}
	
	public void setFid(int fid) {
		this.fid = fid;
	}
	
	public String getLogo() {
		return logo;
	}
	
	public void setLogo(String logo) {
		this.logo = logo;
	}
	
	public String getFirmName() {
		return firmName;
	}
	
	public void setFirmName(String firmName) {
		this.firmName = firmName;
	}
	
	public String getPlace() {
		return place;
	}
	
	public void setPlace(String place) {
		this.place = place;
	}
	
	public String getTel() {
		return tel;
	}
	
	public void setTel(String tel) {
		this.tel = tel;
	}
	
	public String getManager() {
		return manager;
	}
	
	public void setManager(String manager) {
		this.manager = manager;
	}
	
	public String getProfile() {
		return profile;
	}
	
	public void setProfile(String profile) {
		this.profile = profile;
	}
	
	public String getfFile() {
		return fFile;
	}
	
	public void setfFile(String fFile) {
		this.fFile = fFile;
	}
	
}
