package com.recruit.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.recruit.entity.AssociationEntity;
import com.recruit.util.SqlUtil;

public class AssociationDao {
	/**
	 * 查询状态
	 * @param rid
	 * @param jid
	 * @return
	 */
	public AssociationEntity selectState(int rid, int jid) {
		Connection conn = SqlUtil.getConnection();
		String sql = "select * from associations where rid = ? and jid = ?";
		PreparedStatement pst = null;
		ResultSet rs = null;
		AssociationEntity association = null;
		try {
			pst = conn.prepareStatement(sql);
			pst.setInt(1, rid);
			pst.setInt(2, jid);
			rs = pst.executeQuery();
			if(rs.next()) {
				association= new AssociationEntity();
				association.setAid(rs.getInt("aid"));
				association.setRid(rs.getInt("rid"));
				association.setJid(rs.getInt("jid"));
				association.setIsView(rs.getInt("view"));
				association.setIsInterest(rs.getInt("interest"));
				association.setIsInterviewBefore(rs.getInt("interviewBefore"));
				association.setIsInterviewAfter(rs.getInt("interviewAfter"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			SqlUtil.close(rs, pst, conn);
		}
		return association;
	}
	
	/**
	 * 改变为已查看状态
	 * @param rid
	 * @param jid
	 * @return isSuccess
	 */
	public boolean updateStateOfView(int rid, int jid) {
		Connection conn = SqlUtil.getConnection();
		String sql = "update associations set view = 1 where rid = ? and jid = ?"; 
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
	 * 改变为感兴趣状态
	 * @param rid
	 * @param jid
	 * @return isSuccess
	 */
	public boolean updateStateOfInterest(int rid, int jid) {
		Connection conn = SqlUtil.getConnection();
		String sql = "update associations set interest = 1,interviewBefore = 0,interviewAfter = 0 where rid = ? and jid = ?"; 
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
	 * 改变为可面试状态
	 * @param rid
	 * @param jid
	 * @return isSuccess
	 */
	public boolean updateStateOfInterviewBefore(int rid, int jid) {
		Connection conn = SqlUtil.getConnection();
		String sql = "update associations set interest = 0, interviewBefore = 1, interviewAfter = 0 where rid = ? and jid = ?"; 
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
	 * 改变为已面试状态
	 * @param rid
	 * @param jid
	 * @return isSuccess
	 */
	public boolean updateStateOfInterviewAfter(int rid, int jid) {
		Connection conn = SqlUtil.getConnection();
		String sql = "update associations set interest = 0, interviewBefore = 0, interviewAfter = 1 where rid = ? and jid = ?"; 
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
	 * 该用户申请的所有职位的简历
	 * @param rid
	 * @return
	 */
	public  List<AssociationEntity> selectResumeOnAssociationByRid(int rid) {
		Connection conn = SqlUtil.getConnection();
		String sql = "select * from associations left join jobs on associations.jid = jobs.jid  left join firms on jobs.fid = firms.fid where rid = ?";
		PreparedStatement pst = null;
		ResultSet rs = null;
		List<AssociationEntity> list = new ArrayList<>();
		try {
			pst = conn.prepareStatement(sql);
			pst.setInt(1, rid);
			rs = pst.executeQuery();
			while(rs.next()) {
				AssociationEntity association= new AssociationEntity();
				association.setAid(rs.getInt("aid"));
				association.setRid(rs.getInt("rid"));
				association.setJid(rs.getInt("jid"));
				association.setIsView(rs.getInt("view"));
				association.setIsInterest(rs.getInt("interest"));
				association.setIsInterviewBefore(rs.getInt("interviewBefore"));
				association.setIsInterviewAfter(rs.getInt("interviewAfter"));
				association.setJobName(rs.getString("jobName"));
				association.setFirmName(rs.getString("firmName"));
				association.setFid(rs.getInt("fid"));
				list.add(association);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			SqlUtil.close(rs, pst, conn);
		}
		return list;
	}
	
	/**
	 * (已查看)该用户申请的职位的简历
	 * @param rid
	 * @return
	 */
	public  List<AssociationEntity> selectResumeWhenViewOnAssociationByRid(int rid) {
		Connection conn = SqlUtil.getConnection();
		String sql = "select * from associations left join jobs on associations.jid = jobs.jid  left join firms on jobs.fid = firms.fid where rid = ? and view = 1";
		PreparedStatement pst = null;
		ResultSet rs = null;
		List<AssociationEntity> list = new ArrayList<>();
		try {
			pst = conn.prepareStatement(sql);
			pst.setInt(1, rid);
			rs = pst.executeQuery();
			while(rs.next()) {
				AssociationEntity association= new AssociationEntity();
				association.setAid(rs.getInt("aid"));
				association.setRid(rs.getInt("rid"));
				association.setJid(rs.getInt("jid"));
				association.setIsView(rs.getInt("view"));
				association.setIsInterest(rs.getInt("interest"));
				association.setIsInterviewBefore(rs.getInt("interviewBefore"));
				association.setIsInterviewAfter(rs.getInt("interviewAfter"));
				association.setJobName(rs.getString("jobName"));
				association.setFirmName(rs.getString("firmName"));
				association.setFid(rs.getInt("fid"));
				list.add(association);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			SqlUtil.close(rs, pst, conn);
		}
		return list;
	}
	
	/**
	 * (感兴趣)该用户申请的职位的简历
	 * @param rid
	 * @return
	 */
	public  List<AssociationEntity> selectResumeWhenInterestOnAssociationByRid(int rid) {
		Connection conn = SqlUtil.getConnection();
		String sql = "select * from associations left join jobs on associations.jid = jobs.jid  left join firms on jobs.fid = firms.fid where rid = ? and interest = 1";
		PreparedStatement pst = null;
		ResultSet rs = null;
		List<AssociationEntity> list = new ArrayList<>();
		try {
			pst = conn.prepareStatement(sql);
			pst.setInt(1, rid);
			rs = pst.executeQuery();
			while(rs.next()) {
				AssociationEntity association= new AssociationEntity();
				association.setAid(rs.getInt("aid"));
				association.setRid(rs.getInt("rid"));
				association.setJid(rs.getInt("jid"));
				association.setIsView(rs.getInt("view"));
				association.setIsInterest(rs.getInt("interest"));
				association.setIsInterviewBefore(rs.getInt("interviewBefore"));
				association.setIsInterviewAfter(rs.getInt("interviewAfter"));
				association.setJobName(rs.getString("jobName"));
				association.setFirmName(rs.getString("firmName"));
				association.setFid(rs.getInt("fid"));
				list.add(association);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			SqlUtil.close(rs, pst, conn);
		}
		return list;
	}
	
	/**
	 * (邀请面试)该用户申请的职位的简历
	 * @param rid
	 * @return
	 */
	public List<AssociationEntity> selectResumeWhenInterviewBeforeOnAssociationByRid(int rid) {
		Connection conn = SqlUtil.getConnection();
		String sql = "select * from associations left join jobs on associations.jid = jobs.jid  left join firms on jobs.fid = firms.fid where rid = ? and interviewBefore = 1";
		PreparedStatement pst = null;
		ResultSet rs = null;
		List<AssociationEntity> list = new ArrayList<>();
		try {
			pst = conn.prepareStatement(sql);
			pst.setInt(1, rid);
			rs = pst.executeQuery();
			while(rs.next()) {
				AssociationEntity association= new AssociationEntity();
				association.setAid(rs.getInt("aid"));
				association.setRid(rs.getInt("rid"));
				association.setJid(rs.getInt("jid"));
				association.setIsView(rs.getInt("view"));
				association.setIsInterest(rs.getInt("interest"));
				association.setIsInterviewBefore(rs.getInt("interviewBefore"));
				association.setIsInterviewAfter(rs.getInt("interviewAfter"));
				association.setJobName(rs.getString("jobName"));
				association.setFirmName(rs.getString("firmName"));
				association.setFid(rs.getInt("fid"));
				list.add(association);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			SqlUtil.close(rs, pst, conn);
		}
		return list;
	}
	
	/**
	 * (已面试)该用户申请的职位的简历
	 * @param rid
	 * @return
	 */
	public  List<AssociationEntity> selectResumeWhenInterviewAfterOnAssociationByRid(int rid) {
		Connection conn = SqlUtil.getConnection();
		String sql = "select * from associations left join jobs on associations.jid = jobs.jid  left join firms on jobs.fid = firms.fid where rid = ? and interviewAfter = 1";
		PreparedStatement pst = null;
		ResultSet rs = null;
		List<AssociationEntity> list = new ArrayList<>();
		try {
			pst = conn.prepareStatement(sql);
			pst.setInt(1, rid);
			rs = pst.executeQuery();
			while(rs.next()) {
				AssociationEntity association= new AssociationEntity();
				association.setAid(rs.getInt("aid"));
				association.setRid(rs.getInt("rid"));
				association.setJid(rs.getInt("jid"));
				association.setIsView(rs.getInt("view"));
				association.setIsInterest(rs.getInt("interest"));
				association.setIsInterviewBefore(rs.getInt("interviewBefore"));
				association.setIsInterviewAfter(rs.getInt("interviewAfter"));
				association.setJobName(rs.getString("jobName"));
				association.setFirmName(rs.getString("firmName"));
				association.setFid(rs.getInt("fid"));
				list.add(association);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			SqlUtil.close(rs, pst, conn);
		}
		return list;
	}
	
	/**
	 * 该用户申请的职位的简历,用来判断是否已面试
	 * @param rid
	 * @return
	 */
	public  AssociationEntity selectStatusInterviewAfterOnAssociationByRidAndJid(int rid,int jid) {
		Connection conn = SqlUtil.getConnection();
		String sql = "select * from associations left join jobs on associations.jid = jobs.jid  left join firms on jobs.fid = firms.fid where rid = ? and associations.jid=? and interviewAfter = 1";
		PreparedStatement pst = null;
		ResultSet rs = null;
		AssociationEntity association = null;
		try {
			pst = conn.prepareStatement(sql);
			pst.setInt(1, rid);
			pst.setInt(2, jid);
			rs = pst.executeQuery();
			if(rs.next()) {
				association= new AssociationEntity();
				association.setAid(rs.getInt("aid"));
				association.setRid(rs.getInt("rid"));
				association.setJid(rs.getInt("jid"));
				association.setIsView(rs.getInt("view"));
				association.setIsInterest(rs.getInt("interest"));
				association.setIsInterviewBefore(rs.getInt("interviewBefore"));
				association.setIsInterviewAfter(rs.getInt("interviewAfter"));
				association.setJobName(rs.getString("jobName"));
				association.setFirmName(rs.getString("firmName"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			SqlUtil.close(rs, pst, conn);
		}
		return association;
	}
}
