package com.recruit.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.recruit.entity.JobEntity;
import com.recruit.entity.Pager;
import com.recruit.entity.ResumeEntity;
import com.recruit.entity.UserEntity;
import com.recruit.util.SqlUtil;
import com.recruit.util.StringUtils;

public class ResumeDao {
	/**
	 * 添加简历
	 * @param resume
	 * @return
	 */
	public boolean insertResumeByLogin(ResumeEntity resume,int uid) {
		Connection conn = SqlUtil.getConnection();
		String sql = "insert into resumes values(0,?,?,?,?,?,?,?,?,?,?,?)"; 
		PreparedStatement pst = null;
		boolean isSuccess = false;
		try {
			pst = conn.prepareStatement(sql);
			pst.setString(1, resume.getRealName());
			pst.setString(2, resume.getGender());
			pst.setInt(3, resume.getAge());
			pst.setString(4, resume.getPhone());
			pst.setString(5, resume.getEducation());
			pst.setString(6, resume.getExperience());
			pst.setString(7, resume.getIntention());
			pst.setDouble(8, resume.getSalary());
			pst.setString(9, resume.getIntroduction());
			pst.setString(10, resume.getrFile());
			pst.setInt(11, uid);
			isSuccess = pst.executeUpdate() > 0;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return isSuccess;
	}
	
	/**
	 * 根据uid查询简历
	 * @param uid
	 * @return
	 */
	public ResumeEntity selectResumeByUid(int uid) {
		Connection conn = SqlUtil.getConnection();
		String sql = "select * from resumes left join users on users.uid=resumes.uid where resumes.uid=?";
		PreparedStatement pst = null;
		ResultSet rs = null;
		ResumeEntity resume = null;
		try {
			pst = conn.prepareStatement(sql);
			pst.setInt(1, uid);
			rs = pst.executeQuery();
			if(rs.next()) {
				resume = new ResumeEntity();
				resume.setRid(rs.getInt("rid"));
				resume.setRealName(rs.getString("realName"));
				resume.setAge(rs.getInt("age"));
				resume.setGender(rs.getString("gender"));
				resume.setPhone(rs.getString("phone"));
				resume.setEducation(rs.getString("education"));
				resume.setIntention(rs.getString("intention"));
				resume.setSalary(rs.getDouble("salary"));
				resume.setIntroduction(rs.getString("introduction"));
				resume.setExperience(rs.getString("experience"));
				resume.setrFile(rs.getString("rFile"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			SqlUtil.close(rs, pst, conn);
		}
		return resume;
	}


	/**
	 * 修改简历
	 * @param resume
	 * @param uid
	 * @return
	 */
	public boolean updateResume(ResumeEntity resume,int uid) {
		Connection conn = SqlUtil.getConnection();
		String sql = "update resumes set ";
		List<String> list = new ArrayList<>();
		if(StringUtils.isNotNull(resume.getRealName())) {
			sql += "realName=?,";
			list.add(resume.getRealName());
		}if (StringUtils.isNotNull(resume.getGender())) {
			sql += "gender=?,";
			list.add(resume.getGender());
		}if (StringUtils.isNotNull( String.valueOf(resume.getAge()))) {
			sql += "age=?,";
			list.add(String.valueOf(resume.getAge()));
		}if (StringUtils.isNotNull(resume.getPhone())) {
			sql += "phone=?,";
			list.add(resume.getPhone());
		}if (StringUtils.isNotNull(resume.getEducation())) {
			sql += "education=?,";
			list.add(resume.getEducation());
		}if (StringUtils.isNotNull(resume.getExperience())) {
			sql += "experience=?,";
			list.add(resume.getExperience());
		}if (StringUtils.isNotNull(resume.getIntention())) {
			sql += "intention=?,";
			list.add(resume.getIntention());
		}if (StringUtils.isNotNull(String.valueOf(resume.getSalary()))) {
			sql += "salary=?,";
			list.add(String.valueOf(resume.getSalary()));
		}if (StringUtils.isNotNull(resume.getIntroduction())) {
			sql += "introduction=?,";
			list.add(resume.getIntroduction());
		}if (StringUtils.isNotNull(resume.getrFile())) {
			sql += "rFile=?,";
			list.add(resume.getrFile());
		}
		sql = sql.substring(0, sql.length()-1);
		sql += " where uid=?";
		PreparedStatement pst = null;
		boolean isSuccess = false;
		try {
			pst = conn.prepareStatement(sql);
			for (int i = 1; i  <= list.size(); i++) {
				pst.setString(i,list.get(i-1));
			}
			pst.setInt(list.size()+1, uid);
			isSuccess = pst.executeUpdate() > 0;
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			SqlUtil.close(null, pst, conn);
		}
		return isSuccess;
	}

	/**
	 * 查询本公司投递简历
	 * @author 尚恒冉
	 * @param fid
	 * @return list
	 */
	public Pager<ResumeEntity> selectResumesOnFirm(Pager<ResumeEntity> pager,int fid) {
		Connection conn = SqlUtil.getConnection();
		String sql = "select * from resumes left join associations on resumes.rid = associations.rid left join jobs on associations.jid = jobs.jid where resumes.rid in (select rid from associations where jid in (select jid from jobs where fid = ?)) limit ?,?";
		PreparedStatement pst = null;
		ResultSet rs = null;
		List<ResumeEntity> resumes = new ArrayList<>();
		try {
			pst = conn.prepareStatement(sql);
			pst.setInt(1, fid);
			pst.setInt(2, (pager.getPageNow()-1)*pager.getPageSize());
			pst.setInt(3, pager.getPageSize());
			rs = pst.executeQuery();
			while(rs.next()) {
				ResumeEntity resume = new ResumeEntity();
				resume.setRid(rs.getInt("rid"));
				resume.setRealName(rs.getString("realName"));
				resume.setAge(rs.getInt("age"));
				resume.setGender(rs.getString("gender"));
				resume.setPhone(rs.getString("phone"));
				resume.setEducation(rs.getString("education"));
				resume.setIntention(rs.getString("intention"));
				resume.setSalary(rs.getDouble("salary"));
				resume.setIntroduction(rs.getString("introduction"));
				resume.setExperience(rs.getString("experience"));
				resume.setrFile(rs.getString("rFile"));
				JobEntity job = new JobEntity();
				job.setJid(rs.getInt("jid"));
				job.setJobName(rs.getString("jobName"));
				job.setPay(rs.getDouble("pay"));
				job.setReqExperience(rs.getString("reqExperience"));
				job.setReqEducation(rs.getString("reqEducation"));
				job.setAttract(rs.getString("attract"));
				job.setDescription(rs.getString("description"));
				resume.setJob(job);
				resumes.add(resume);
			}
			pager.setLists(resumes);
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			SqlUtil.close(rs, pst, conn);
		}
		return pager;
	}
	
	/**
	 * 查询简历
	 * @param rid
	 * @return resume
	 */
	public ResumeEntity selectResumeByRid(int rid) {
		Connection conn = SqlUtil.getConnection();
		String sql = "select * from resumes where rid = ?";
		PreparedStatement pst = null;
		ResultSet rs = null;
		ResumeEntity resume = null;
		try {
			pst = conn.prepareStatement(sql);
			pst.setInt(1, rid);
			rs = pst.executeQuery();
			if(rs.next()) {
				resume = new ResumeEntity();
				resume.setRid(rs.getInt("rid"));
				resume.setRealName(rs.getString("realName"));
				resume.setAge(rs.getInt("age"));
				resume.setGender(rs.getString("gender"));
				resume.setPhone(rs.getString("phone"));
				resume.setEducation(rs.getString("education"));
				resume.setIntention(rs.getString("intention"));
				resume.setSalary(rs.getDouble("salary"));
				resume.setIntroduction(rs.getString("introduction"));
				resume.setExperience(rs.getString("experience"));
				resume.setrFile(rs.getString("rFile"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			SqlUtil.close(rs, pst, conn);
		}
		return resume;
	}
	
	/**
	 * 查询简历数量
	 * @return
	 */
	public int selectTotalCount() {
		Connection conn = SqlUtil.getConnection();
		String sql = "select count(*) c from resumes";
		PreparedStatement pst = null;
		ResultSet rs = null;
		int count = 0;
		try {
			pst = conn.prepareStatement(sql);
			rs = pst.executeQuery();
			if(rs.next()) {
				count = rs.getInt("c");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			SqlUtil.close(rs, pst, conn);
		}
		return count;
	}
	/**
	 * 查询该公司接收简历总数
	 * @param fid
	 * @return
	 */
	public int selectTotalCountByFid(int fid) {
		Connection conn = SqlUtil.getConnection();
		String sql = "select count(*) c from associations where jid in (select jid from jobs where fid = ?)";
		PreparedStatement pst = null;
		ResultSet rs = null;
		int count = 0;
		try {
			pst = conn.prepareStatement(sql);
			pst.setInt(1, fid);
			rs = pst.executeQuery();
			if(rs.next()) {
				count = rs.getInt("c");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			SqlUtil.close(rs, pst, conn);
		}
		return count;
	}
	/**
	 * 简历查询
	 * @param pager
	 * @return
	 */
	public Pager<ResumeEntity> selectResume(Pager<ResumeEntity> pager) {
		Connection conn = SqlUtil.getConnection();
		String sql = "select * from resumes limit ?,?";
		PreparedStatement pst = null;
		ResultSet rs = null;
		List<ResumeEntity> list = new ArrayList<>();
		ResumeEntity resume = null;
		try{
			pst = conn.prepareStatement(sql);
			pst.setInt(1, (pager.getPageNow()-1)*pager.getPageSize());
			pst.setInt(2, pager.getPageSize());
			rs = pst.executeQuery();
			while(rs.next()) {
				resume = new ResumeEntity();
				resume.setRid(rs.getInt("rid"));
				resume.setUid(rs.getInt("uid"));
				resume.setRealName(rs.getString("realName"));
				resume.setGender(rs.getString("gender"));
				resume.setAge(rs.getInt("age"));
				resume.setPhone(rs.getString("phone"));
				resume.setEducation(rs.getString("education"));
				resume.setExperience(rs.getString("experience"));
				resume.setIntention(rs.getString("intention"));
				resume.setSalary(rs.getDouble("salary"));
				resume.setIntroduction(rs.getString("introduction"));
				resume.setrFile(rs.getString("rFile"));
				list.add(resume);
			}
			pager.setLists(list);
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			SqlUtil.close(rs, pst, conn);
		}
		return pager;
	}
	
	/**
	 * 简历删除
	 * @param rid
	 * @return
	 */
	 public boolean deleteResume(int rid){  //删除
		Connection conn =  SqlUtil.getConnection();
        String sql = "delete from resumes where rid=?";  //删除的SQL语句，根据ID删除
        PreparedStatement pst = null;
        boolean isSuccess = false;
        try {
            pst = conn.prepareStatement(sql);
            pst.setInt(1, rid);
            isSuccess = pst.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return isSuccess;
    }
}
