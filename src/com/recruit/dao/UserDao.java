package com.recruit.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.recruit.entity.CommentsEntity;
import com.recruit.entity.FirmEntity;
import com.recruit.entity.JobEntity;
import com.recruit.entity.Pager;
import com.recruit.entity.UserEntity;
import com.recruit.util.SqlUtil;
import com.recruit.util.StringUtils;

public class UserDao {
	/**
	 * 注册用户
	 * @param user
	 * @return
	 */
	public boolean addUser(UserEntity user) {
		Connection conn = SqlUtil.getConnection();
		String sql = "insert into users(username,password,type) values(?,md5(?),?)";
		PreparedStatement pst = null;
		boolean isSuccess = false;
		try {
			pst = conn.prepareStatement(sql);
			pst.setString(1,user.getUsername());
			pst.setString(2,user.getPassword());
			pst.setString(3,user.getType());
			isSuccess = pst.executeUpdate() > 0;
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			SqlUtil.close(null, pst, conn);
		}
		return isSuccess;
	}
	
	/**
	 * 登录用户
	 * @param user
	 * @return
	 */
	public UserEntity selectUserByLogin(UserEntity user) {
		Connection conn = SqlUtil.getConnection();
		String sql = "select * from users where username=? and password=md5(?) and type=?";
		PreparedStatement pst = null;
		ResultSet rs = null;
		UserEntity u = null;
		try {
			pst = conn.prepareStatement(sql);
			pst.setString(1, user.getUsername());
			pst.setString(2, user.getPassword());
			pst.setString(3, user.getType());
			rs = pst.executeQuery();
			if(rs.next()) {
				u = new UserEntity();
				u.setUid(rs.getInt("uid"));
				u.setPhoto(rs.getString("photo"));
				u.setUsername(rs.getString("username"));
				u.setPassword(rs.getString("password"));
				u.setType(rs.getString("type"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			SqlUtil.close(rs, pst, conn);
		}
		return u;
	}
	
	/**
	 * 修改图片
	 * @param user
	 * @return
	 */
	public boolean update_photo(UserEntity user) {
		Connection conn = SqlUtil.getConnection();
		String sql = "update users set photo=? where uid=?";
		PreparedStatement pst = null;
		boolean isSuccess = false;
		try {
			pst = conn.prepareStatement(sql);
			pst.setString(1, user.getPhoto());
			pst.setInt(2, user.getUid());
			isSuccess = pst.executeUpdate() > 0;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return isSuccess;
	}
	
	/**
	 * 修改密码
	 * @param user
	 * @param oldPassword
	 * @param newPassword
	 * @return
	 */
	public boolean update_password(UserEntity user,String oldPassword,String newPassword) {
		Connection conn = SqlUtil.getConnection();
		String sql = "update users set password=md5(?) where uid=? and password=md5(?)";
		PreparedStatement pst = null;
		boolean isSuccess = false;
		try {
			pst = conn.prepareStatement(sql);
			pst.setString(1, newPassword);
			pst.setInt(2, user.getUid());
			pst.setString(3, oldPassword);
			isSuccess = pst.executeUpdate() > 0;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return isSuccess;
	}
	
	/**
	 * 用户根据fid查询一个企业信息
	 * @param user
	 * @param oldPassword
	 * @param newPassword
	 * @return
	 */
	public FirmEntity selectFirmByFidForLook(int fid) {
		Connection conn = SqlUtil.getConnection();
		String sql = "select * from firms where fid=?";
		PreparedStatement pst = null;
		ResultSet rs = null;
		FirmEntity firm = null;
		try {
			pst = conn.prepareStatement(sql);
			pst.setInt(1, fid);
			rs = pst.executeQuery();
			if(rs.next()) {
				firm = new FirmEntity();
				firm.setFid(rs.getInt("fid"));
				firm.setFirmName(rs.getString("firmName"));
				firm.setLogo(rs.getString("logo"));
				firm.setManager(rs.getString("manager"));
				firm.setPlace(rs.getString("place"));
				firm.setTel(rs.getString("tel"));
				firm.setProfile(rs.getString("profile"));
				firm.setfFile(rs.getString("fFile"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			SqlUtil.close(rs, pst, conn);
		}
		return firm;
	}
	
	/**
	 * 查询该公司的所有评论
	 * @param fid
	 * @param pager
	 * @return
	 */
	public Pager<CommentsEntity> selectAllUsersCommentsToFirmByFid(int fid,Pager<CommentsEntity> pager){
		Connection conn = SqlUtil.getConnection();
		String sql = "select * from comments left join users on comments.uid=users.uid where comments.fid=? order by comments.sendTime desc limit ?,?";
		PreparedStatement pst = null;
		ResultSet rs = null;
		List<CommentsEntity> comments = new ArrayList<>();
		try {
			pst = conn.prepareStatement(sql);
			pst.setInt(1, fid);
			pst.setInt(2, (pager.getPageNow()-1)*pager.getPageSize());
			pst.setInt(3, pager.getPageSize());
			rs = pst.executeQuery();
			while(rs.next()) {
				CommentsEntity comment = new CommentsEntity();
				comment.setCid(rs.getInt("cid"));
				comment.setUid(rs.getInt("uid"));
				comment.setFid(rs.getInt("fid"));
				comment.setContent(rs.getString("content"));
				comment.setSendTime(rs.getString("sendTime"));
				UserEntity user = new UserEntity();
				user.setUid(rs.getInt("uid"));
				user.setUsername(rs.getString("username"));
				user.setPassword(rs.getString("password"));
				user.setType(rs.getString("type"));
				user.setPhoto(rs.getString("photo"));
				comment.setUser(user);
				comments.add(comment);
			}
			pager.setLists(comments);
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			SqlUtil.close(rs, pst, conn);
		}
		return pager;
	}
	
	/**
	 * 用户添加评论
	 * @param comment
	 * @return
	 */
	public boolean addCommentToFirm(CommentsEntity comment) {
		Connection conn = SqlUtil.getConnection();
		String sql = "insert into comments(cid,uid,fid,content,sendTime) values(0,?,?,?,?)";
		PreparedStatement pst = null;
		boolean isSuccess = false;
		try {
			pst = conn.prepareStatement(sql);
			pst.setInt(1, comment.getUid());
			pst.setInt(2, comment.getFid());
			pst.setString(3, comment.getContent());
			pst.setString(4, comment.getSendTime());
			isSuccess = pst.executeUpdate() > 0;
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			SqlUtil.close(null, pst, conn);
		}
		return isSuccess;
	}
	
	/**
	 * 查询评论总条数
	 * @param comment
	 * @return
	 */
	public int selectCountComment(int fid) {
		Connection conn = SqlUtil.getConnection();
		String sql = "select count(*) c from comments where fid=?";
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
			SqlUtil.close(null, pst, conn);
		}
		return count;
	}
	
	/**
	 * 查询是否有该用户名
	 * @param username
	 * @return
	 */
	public boolean selectUserByUsername(String username) {
		Connection conn = SqlUtil.getConnection();
		String sql = "select * from users where username=?";
		PreparedStatement pst = null;
		ResultSet rs = null;
		boolean isExist = false;
		try {
			pst = conn.prepareStatement(sql);
			pst.setString(1, username);
			rs = pst.executeQuery();
			isExist = rs.next();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			SqlUtil.close(rs, pst, conn);
		}
		return isExist;
	}
	/**
	 * 修改密码对原密码的验证
	 * @param user
	 * @return
	 */
	public boolean selectUserByPassword(String username,String password) {
		Connection conn = SqlUtil.getConnection();
		String sql = "select * from users where username=? and password=md5(?)";
		PreparedStatement pst = null;
		ResultSet rs = null;
		boolean isSuccess = false;
		try {
			pst = conn.prepareStatement(sql);
			pst.setString(1, username);
			pst.setString(2, password);
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
	 * 查询根据工作名称模糊查询工作
	 * @param username
	 * @return
	 */
	public List<JobEntity> selectJobsByJobName(String jobName) {
		Connection conn = SqlUtil.getConnection();
		String sql = "select * from jobs left join firms on jobs.fid=firms.fid where jobs.jobName like ?";
		PreparedStatement pst = null;
		ResultSet rs = null;
		List<JobEntity> list = new ArrayList<>();
		try {
			pst = conn.prepareStatement(sql);
			pst.setString(1, "%"+jobName+"%");
			rs = pst.executeQuery();
			while(rs.next()) {
				JobEntity job = new JobEntity();
				job.setJid(rs.getInt("jid"));
				job.setJobName(rs.getString("jobName"));
				job.setPay(rs.getDouble("pay"));
				job.setDescription(rs.getString("description"));
				job.setAttract(rs.getString("attract"));
				job.setReqEducation(rs.getString("reqEducation"));
				job.setReqExperience(rs.getString("reqExperience"));
				FirmEntity firm = new FirmEntity();
				firm.setFid(rs.getInt("fid"));
				firm.setFirmName(rs.getString("firmName"));
				job.setFirm(firm);
				list.add(job);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			SqlUtil.close(rs, pst, conn);
		}
		return list;
	}
	
	/**
	 * 查询用户数量
	 * @return
	 */
	public int selectTotalCount() {
		Connection conn = SqlUtil.getConnection();
		String sql = "select count(*) c from users";
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
	 * 用户查询,分页
	 * @param pager
	 * @return
	 */
	public Pager<UserEntity> selectUser(Pager<UserEntity> pager) {
		Connection conn = SqlUtil.getConnection();
		String sql = "select * from users limit ?,?";
		PreparedStatement pst = null;
		ResultSet rs = null;
		List<UserEntity> list = new ArrayList<>();
		UserEntity user = null;
		try{
			pst = conn.prepareStatement(sql);
			pst.setInt(1, (pager.getPageNow()-1)*pager.getPageSize());
			pst.setInt(2, pager.getPageSize());
			rs = pst.executeQuery();
			while(rs.next()) {
				user = new UserEntity();
				user.setUid(rs.getInt("uid"));
				user.setPhoto(rs.getString("photo"));
				user.setUsername(rs.getString("username"));
				user.setPassword(rs.getString("password"));
				user.setType(rs.getString("type"));
				list.add(user);
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
	 * 用户删除
	 * @param uid
	 * @return
	 */
	 public boolean deleteUser(int uid){  //删除
		Connection conn =  SqlUtil.getConnection();
        String sql = "delete from users where uid=?";  //删除的SQL语句，根据ID删除
        PreparedStatement pst = null;
        boolean isSuccess = false;
        try {
            pst = conn.prepareStatement(sql);
            pst.setInt(1, uid);
            isSuccess = pst.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return isSuccess;
    }
	 
	 /**
	  * 搜索用户
	  * @param userName
	  * @param password
	  * @return
	  */
	 public boolean getSelect(String userName,String password) { 
		   String sql = "select * from user where userName='"+userName+"' and password='"+password+"'"; 
		   Connection conn = SqlUtil.getConnection();
		   PreparedStatement pst = null;
		   boolean flag=false;
		   try {
		    pst = (PreparedStatement) conn.prepareStatement(sql);
		    ResultSet rs = pst.executeQuery();
		    if (rs.next()) {
		     flag=true;
		    }
		   } catch (Exception e) {
		   }
		   return flag;
	  }
	 
	 /**
	  * 用户修改
	  * @param user
	  * @return
	  */
	 public boolean updateUser(UserEntity user){
			Connection conn= SqlUtil.getConnection();
			PreparedStatement pst = null;
			//动态sql
			List<String> list =new ArrayList<>();
			boolean isSuccess = false;
			//动态拼接
			String sql = "update users set ";
			if(StringUtils.isNotNull(user.getUsername())){
				sql += "username=?,";
				list.add(user.getUsername());			
			}
			if(StringUtils.isNotNull(user.getPassword())){
				sql += "password=md5(?),";
				list.add(user.getPassword());			
			}
			if(StringUtils.isNotNull(user.getPhoto())){
				sql += "photo=?,";
				list.add(user.getPhoto());			
			}
			sql = sql.substring(0,sql.length()-1);
			sql += " where uid=?";
			try {
				pst = conn.prepareStatement(sql);
				//动态注入
				for(int i = 1;i<=list.size();i++){
					pst.setString(i, list.get(i-1));
				}
				pst.setInt(list.size()+1,user.getUid());
				isSuccess = pst.executeUpdate() > 0;
			} catch (SQLException e) {
				e.printStackTrace();
			}finally{
				SqlUtil.close(null, pst, conn);
			}
			return isSuccess;
		}
}
