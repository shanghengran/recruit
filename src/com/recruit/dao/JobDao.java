package com.recruit.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.recruit.entity.FirmEntity;
import com.recruit.entity.JobEntity;
import com.recruit.entity.Pager;
import com.recruit.util.SqlUtil;

public class JobDao {
	/**
	 * 插入新职位
	 * @param job
	 * @param fid
	 * @return
	 */
	public boolean insertJob(JobEntity job,int fid) {
		Connection conn = SqlUtil.getConnection();
		String sql = "insert into jobs(jobName,pay,reqExperience,reqEducation,attract,description,fid) values(?,?,?,?,?,?,?)";
		PreparedStatement pst = null;
		boolean isSuccess = false;
		try {
			pst = conn.prepareStatement(sql);
			pst.setString(1, job.getJobName());
			pst.setDouble(2, job.getPay());
			pst.setString(3, job.getReqExperience());
			pst.setString(4, job.getReqEducation());
			pst.setString(5, job.getAttract());
			pst.setString(6, job.getDescription());
			pst.setInt(7, fid);
			isSuccess = pst.executeUpdate() > 0;
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			SqlUtil.close(null, pst, conn);
		}
		return isSuccess;
	}
	
	/**
	 * 删除职位
	 * @param jid
	 * @return isSuccess
	 */
	public boolean deleteJobByJid(int jid) {
		Connection conn = SqlUtil.getConnection();
		String sql = "delete from jobs where jid = ?";
		PreparedStatement pst = null;
		boolean isSuccess = false;
		try {
			pst = conn.prepareStatement(sql);
			pst.setInt(1, jid);
			isSuccess = pst.executeUpdate() > 0;
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			SqlUtil.close(null, pst, conn);
		}
		return isSuccess;
	}
	
	/**
	 * 修改职位信息
	 * @param jid
	 * @return
	 */
	public boolean updateJobByJid(JobEntity job) {
		Connection conn = SqlUtil.getConnection();
		String sql = "update jobs set jobName = ?,pay = ?,reqExperience = ?,reqEducation = ?,attract = ?,description = ? where jid = ?";
		PreparedStatement pst = null;
		boolean isSuccess = false;
		try {
			pst = conn.prepareStatement(sql);
			pst.setString(1, job.getJobName());
			pst.setDouble(2, job.getPay());
			pst.setString(3, job.getReqExperience());
			pst.setString(4, job.getReqEducation());
			pst.setString(5, job.getAttract());
			pst.setString(6, job.getDescription());
			pst.setInt(7, job.getJid());
			isSuccess = pst.executeUpdate() > 0;
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			SqlUtil.close(null, pst, conn);
		}
		return isSuccess;
	}
	
	/**
	 * 查询公司发布的职位
	 * @param uid
	 * @return
	 */
	public List<JobEntity> selectJobsByFid(int fid) {
		Connection conn = SqlUtil.getConnection();
		String sql = "select * from jobs where fid = ?";
		PreparedStatement pst = null;
		ResultSet rs = null;
		List<JobEntity> jobs = new ArrayList<>();
		try {
			pst = conn.prepareStatement(sql);
			pst.setInt(1, fid);
			rs = pst.executeQuery();
			while(rs.next()) {
				JobEntity job = new JobEntity();
				job.setJid(rs.getInt("jid"));
				job.setJobName(rs.getString("jobName"));
				job.setPay(rs.getDouble("pay"));
				job.setReqExperience(rs.getString("reqExperience"));
				job.setReqEducation(rs.getString("reqEducation"));
				job.setAttract(rs.getString("attract"));
				job.setDescription(rs.getString("description"));
				jobs.add(job);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			SqlUtil.close(rs, pst, conn);
		}
		return jobs;
	}
	
	/**
	 * 查询单个职位
	 * @param jid
	 * @return job
	 */
	public JobEntity selectJobByJid(int jid) {
		Connection conn = SqlUtil.getConnection();
		String sql = "select * from jobs where jid = ?";
		PreparedStatement pst = null;
		ResultSet rs = null;
		JobEntity job = null;
		try {
			pst = conn.prepareStatement(sql);
			pst.setInt(1, jid);
			rs = pst.executeQuery();
			while(rs.next()) {
				job = new JobEntity();
				job.setJid(rs.getInt("jid"));
				job.setJobName(rs.getString("jobName"));
				job.setPay(rs.getDouble("pay"));
				job.setReqExperience(rs.getString("reqExperience"));
				job.setReqEducation(rs.getString("reqEducation"));
				job.setAttract(rs.getString("attract"));
				job.setDescription(rs.getString("description"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			SqlUtil.close(rs, pst, conn);
		}
		return job;
	}
	
	/**
	 * 查询所有职位详细信息
	 * @param jid
	 * @return job
	 */
	public Pager<JobEntity> selectJobs(Pager<JobEntity> pager) {
		Connection conn = SqlUtil.getConnection();
		String sql = "select * from jobs left join firms on jobs.fid=firms.fid limit ?,?";
		PreparedStatement pst = null;
		ResultSet rs = null;
		List<JobEntity> list = new ArrayList<>();
		try {
			pst = conn.prepareStatement(sql);
			pst.setInt(1, (pager.getPageNow()-1)*pager.getPageSize());
			pst.setInt(2, pager.getPageSize());
			rs = pst.executeQuery();
			while(rs.next()) {
				JobEntity job = new JobEntity();
				job.setJid(rs.getInt("jid"));
				job.setJobName(rs.getString("jobName"));
				job.setPay(rs.getDouble("pay"));
				job.setReqExperience(rs.getString("reqExperience"));
				job.setReqEducation(rs.getString("reqEducation"));
				job.setAttract(rs.getString("attract"));
				job.setDescription(rs.getString("description"));
				
				FirmEntity firm = new FirmEntity();
				firm.setFid(rs.getInt("fid"));
				firm.setLogo(rs.getString("logo"));
				firm.setFirmName(rs.getString("firmName"));
				firm.setPlace(rs.getString("place"));
				firm.setTel(rs.getString("tel"));
				firm.setManager(rs.getString("manager"));
				firm.setProfile(rs.getString("profile"));
				firm.setfFile(rs.getString("ffile"));
				job.setFirm(firm);
				list.add(job);
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
	 * 查询该公司发布的职位总数
	 * @param pager
	 * @return job
	 */
	public Pager<JobEntity> selectJobsByFid(Pager<JobEntity> pager,int fid) {
		Connection conn = SqlUtil.getConnection();
		String sql = "select * from jobs left join firms on jobs.fid=firms.fid where firms.fid = ? limit ?,?";
		PreparedStatement pst = null;
		ResultSet rs = null;
		List<JobEntity> jobs = new ArrayList<>();
		try {
			pst = conn.prepareStatement(sql);
			pst.setInt(1, fid);
			pst.setInt(2, (pager.getPageNow()-1)*pager.getPageSize());
			pst.setInt(3, pager.getPageSize());
			rs = pst.executeQuery();
			while(rs.next()) {
				JobEntity job = new JobEntity();
				job.setJid(rs.getInt("jid"));
				job.setJobName(rs.getString("jobName"));
				job.setPay(rs.getDouble("pay"));
				job.setReqExperience(rs.getString("reqExperience"));
				job.setReqEducation(rs.getString("reqEducation"));
				job.setAttract(rs.getString("attract"));
				job.setDescription(rs.getString("description"));
				
				FirmEntity firm = new FirmEntity();
				firm.setFid(rs.getInt("fid"));
				firm.setLogo(rs.getString("logo"));
				firm.setFirmName(rs.getString("firmName"));
				firm.setPlace(rs.getString("place"));
				firm.setTel(rs.getString("tel"));
				firm.setManager(rs.getString("manager"));
				firm.setProfile(rs.getString("profile"));
				firm.setfFile(rs.getString("ffile"));
				job.setFirm(firm);
				jobs.add(job);
			}
			pager.setLists(jobs);
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			SqlUtil.close(rs, pst, conn);
		}
		return pager;
	}
	/**
	 * 查询单个职位连接公司
	 * @param jid
	 * @return job
	 */
	public JobEntity selectJobByJidToFirm(int jid) {
		Connection conn = SqlUtil.getConnection();
		String sql = "select * from jobs left join firms on jobs.fid=firms.fid where jid = ?";
		PreparedStatement pst = null;
		ResultSet rs = null;
		JobEntity job = null;
		try {
			pst = conn.prepareStatement(sql);
			pst.setInt(1, jid);
			rs = pst.executeQuery();
			while(rs.next()) {
				job = new JobEntity();
				job.setJid(rs.getInt("jid"));
				job.setJobName(rs.getString("jobName"));
				job.setPay(rs.getDouble("pay"));
				job.setReqExperience(rs.getString("reqExperience"));
				job.setReqEducation(rs.getString("reqEducation"));
				job.setAttract(rs.getString("attract"));
				job.setDescription(rs.getString("description"));
				
				FirmEntity firm = new FirmEntity();
				firm.setFid(rs.getInt("fid"));
				firm.setLogo(rs.getString("logo"));
				firm.setFirmName(rs.getString("firmName"));
				firm.setPlace(rs.getString("place"));
				firm.setTel(rs.getString("tel"));
				firm.setManager(rs.getString("manager"));
				firm.setProfile(rs.getString("profile"));
				firm.setfFile(rs.getString("ffile"));
				job.setFirm(firm);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			SqlUtil.close(rs, pst, conn);
		}
		return job;
	}
	
	/**
	 * 申请职位
	 * @param jid
	 * @param rid
	 * @return
	 */
	public boolean applyJob(int rid,int jid) {
		Connection conn = SqlUtil.getConnection();
		String sql = "insert into associations(rid,jid) values(?,?)";
		PreparedStatement pst = null;
		boolean isSuccess = false;
		try {
			pst = conn.prepareStatement(sql);
			pst.setInt(1, rid);
			pst.setInt(2, jid);
			isSuccess = pst.executeUpdate() > 0;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return isSuccess;
	}
	
	/**
	 * 查询是否申请职位
	 * @param jid
	 * @param rid
	 * @return
	 */
	public boolean isApply(int rid,int jid) {
		Connection conn = SqlUtil.getConnection();
		String sql = "select * from associations where rid=? and jid=?";
		PreparedStatement pst = null;
		ResultSet rs = null;
		boolean isSuccess = false;
		try {
			pst = conn.prepareStatement(sql);
			pst.setInt(1, rid);
			pst.setInt(2, jid);
			rs = pst.executeQuery();
			isSuccess = rs.next();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			SqlUtil.close(rs, pst, conn);
		}
		return isSuccess;
	}
	
	/**
	 * 查询工作数量
	 * @return
	 */
	public int selectTotalCount() {
		Connection conn = SqlUtil.getConnection();
		String sql = "select count(*) c from jobs";
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
	 * 查询工作数量
	 * @return
	 */
	public int selectTotalCountByFid(int fid) {
		Connection conn = SqlUtil.getConnection();
		String sql = "select count(*) c from jobs where fid = ?";
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
	 * 职位查询
	 * @param pager
	 * @return
	 */
	public Pager<JobEntity> selectJob(Pager<JobEntity> pager) {
		Connection conn = SqlUtil.getConnection();
		String sql = "select * from jobs limit ?,?";
		PreparedStatement pst = null;
		ResultSet rs = null;
		List<JobEntity> list = new ArrayList<>();
		JobEntity jobs = null;
		try{
			pst = conn.prepareStatement(sql);
			pst.setInt(1, (pager.getPageNow()-1)*pager.getPageSize());
			pst.setInt(2, pager.getPageSize());
			rs = pst.executeQuery();
			while(rs.next()) {
				jobs = new JobEntity();
				jobs.setJid(rs.getInt("jid"));
				jobs.setFid(rs.getInt("fid"));
				jobs.setJobName(rs.getString("jobName"));
				jobs.setPay(rs.getDouble("pay"));
				jobs.setReqExperience(rs.getString("reqExperience"));
				jobs.setReqEducation(rs.getString("reqEducation"));
				jobs.setAttract(rs.getString("attract"));
				jobs.setDescription(rs.getString("description"));
			
				list.add(jobs);
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
	 * 职位删除
	 * @param jid
	 * @return
	 */
	 public  boolean deleteJob(int jid){  //删除职位
		Connection conn =  SqlUtil.getConnection();
        String sql = "delete from jobs where jid=?";  //删除的SQL语句，根据ID删除
        PreparedStatement pst = null;
        boolean isSuccess = false;
        try {
            pst = conn.prepareStatement(sql);
            pst.setInt(1, jid);
            isSuccess = pst.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return isSuccess;
    }
}
