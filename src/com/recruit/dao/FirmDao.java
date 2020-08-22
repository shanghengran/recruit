package com.recruit.dao;
/**
 * 公司数据库
 * @author Administrator
 *
 */

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.recruit.entity.FirmEntity;
import com.recruit.entity.Pager;
import com.recruit.entity.UserEntity;
import com.recruit.util.SqlUtil;
import com.recruit.util.StringUtils;

public class FirmDao {
	/**
	 * 查询用户
	 * @param uid
	 * @return user
	 */
	public UserEntity selectUserByUid(int uid) {
		Connection conn = SqlUtil.getConnection();
		String sql = "select * from users where uid = ?";
		PreparedStatement pst = null;
		ResultSet rs = null;
		UserEntity userEntity = null;
		try {
			pst = conn.prepareStatement(sql);
			pst.setInt(1, uid);
			rs = pst.executeQuery();
			if(rs.next()) {
				userEntity = new UserEntity();
				userEntity.setUid(rs.getInt("uid"));
				userEntity.setPhoto(rs.getString("photo"));
				userEntity.setUsername(rs.getString("username"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			SqlUtil.close(rs, pst, conn);
		}
		return userEntity;
	}
	
	/**
	 * 更新用户信息
	 * @param uid
	 * @return isSuccess
	 */
	public boolean updateUser(UserEntity user,String oldPassword) {
		Connection conn = SqlUtil.getConnection();
		boolean isExist = false;
		String sql = "update users set photo = ?";
		if(StringUtils.isNotNull(user.getPassword())) {
			sql += ",password = md5(?) ";
			isExist = true;
		}
		sql += "where uid = ?";
		if(StringUtils.isNotNull(oldPassword)) {
			sql += " and password = md5(?)";
		}
		PreparedStatement pst = null;
		boolean isSuccess = false;
		try {
			pst = conn.prepareStatement(sql);
			pst.setString(1, user.getPhoto());
			if(isExist) {
				pst.setString(2, user.getPassword());
				pst.setInt(3, user.getUid());
				pst.setString(4, oldPassword);
			}else {
				pst.setInt(2, user.getUid());
			}
			isSuccess = pst.executeUpdate() > 0;
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			SqlUtil.close(null, pst, conn);
		}
		return isSuccess;
	}
	
	/**
	 * 查询公司信息
	 * @param uid
	 * @return Firm
	 */
	public FirmEntity selectFirmByUid(int uid) {
		Connection conn = SqlUtil.getConnection();
		String sql = "select * from firms where uid = ?";
		PreparedStatement pst = null;
		ResultSet rs = null;
		FirmEntity firmEntity = null;
		try {
			pst = conn.prepareStatement(sql);
			pst.setInt(1, uid);
			rs = pst.executeQuery();
			if(rs.next()) {
				firmEntity = new FirmEntity();
				firmEntity.setFid(rs.getInt("fid"));
				firmEntity.setLogo(rs.getString("logo"));
				firmEntity.setFirmName(rs.getString("firmName"));
				firmEntity.setPlace(rs.getString("place"));
				firmEntity.setTel(rs.getString("tel"));
				firmEntity.setManager(rs.getString("manager"));
				firmEntity.setProfile(rs.getString("profile"));
				firmEntity.setfFile(rs.getString("ffile"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			SqlUtil.close(rs, pst, conn);
		}
		return firmEntity;
	}
	
	/**
	 * 插入公司数据
	 * @param uid
	 * @return isSuccess
	 */
	public boolean insertFirm(FirmEntity firm,int uid) {
		Connection conn = SqlUtil.getConnection();
		String sql = "insert into firms(firmName,place,tel,manager,profile,fFile,uid) values(?,?,?,?,?,?,?)";
		PreparedStatement pst = null;
		boolean isSuccess = false;
		try {
			pst = conn.prepareStatement(sql);
			pst.setString(1, firm.getFirmName());
			pst.setString(2, firm.getPlace());
			pst.setString(3, firm.getTel());
			pst.setString(4, firm.getManager());
			pst.setString(5, firm.getProfile());
			pst.setString(6, firm.getfFile());
			pst.setInt(7, uid);
			isSuccess = pst.executeUpdate() > 0;
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			SqlUtil.close(null, pst, conn);
		}
		return isSuccess;
	}
	
	/**
	 * 更新公司信息
	 * @param firm
	 * @return
	 */
	public boolean upadteFirm(FirmEntity firm) {
		Connection conn = SqlUtil.getConnection();
		String sql = "update firms set ";
		List<String> list = new ArrayList<>();
		if(StringUtils.isNotNull(firm.getLogo())) {
			sql += "logo=?,";
			list.add(firm.getLogo());
		}if (StringUtils.isNotNull(firm.getFirmName())) {
			sql += "firmName=?,";
			list.add(firm.getFirmName());
		}if (StringUtils.isNotNull(firm.getPlace())) {
			sql += "place=?,";
			list.add(firm.getPlace());
		}if (StringUtils.isNotNull(firm.getTel())) {
			sql += "tel=?,";
			list.add(firm.getTel());
		}if (StringUtils.isNotNull(firm.getManager())) {
			sql += "manager=?,";
			list.add(firm.getManager());
		}if (StringUtils.isNotNull(firm.getProfile())) {
			sql += "profile=?,";
			list.add(firm.getProfile());
		}if (StringUtils.isNotNull(firm.getfFile())) {
			sql += "fFile=?,";
			list.add(firm.getfFile());
		}
		sql = sql.substring(0, sql.length()-1);
		sql += " where fid=?";
		PreparedStatement pst = null;
		boolean isSuccess = false;
		try {
			pst = conn.prepareStatement(sql);
			for (int i = 1; i  <= list.size(); i++) {
				pst.setString(i,list.get(i-1));
			}
			pst.setInt(list.size()+1, firm.getFid());
			isSuccess = pst.executeUpdate() > 0;
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			SqlUtil.close(null, pst, conn);
		}
		return isSuccess;
	}
	
	/**
	 * 查询公司总数
	 * @return
	 */
	public int selectTotalCount() {
		Connection conn = SqlUtil.getConnection();
		String sql = "select count(*) c from firms";
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
	 * 公司查询
	 * @param pager
	 * @return
	 */
	public Pager<FirmEntity> selectFirm(Pager<FirmEntity> pager) {
		Connection conn = SqlUtil.getConnection();
		String sql = "select * from firms limit ?,?";
		PreparedStatement pst = null;
		ResultSet rs = null;
		List<FirmEntity> list = new ArrayList<>();
		FirmEntity firm = null;
		try{
			pst = conn.prepareStatement(sql);
			pst.setInt(1, (pager.getPageNow()-1)*pager.getPageSize());
			pst.setInt(2, pager.getPageSize());
			rs = pst.executeQuery();
			while(rs.next()) {
				firm = new FirmEntity();
				firm.setFid(rs.getInt("fid"));
				firm.setLogo(rs.getString("logo"));
				firm.setFirmName(rs.getString("firmName"));
				firm.setPlace(rs.getString("place"));
				firm.setTel(rs.getString("tel"));
				firm.setManager(rs.getString("manager"));
				firm.setProfile(rs.getString("profile"));
				firm.setfFile(rs.getString("fFile"));
				list.add(firm);
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
	 * 删除公司
	 * @param fid
	 * @return
	 */
	 public boolean deleteFirm(int fid){  //删除
		 Connection conn =  SqlUtil.getConnection();
	        String sql = "delete from firms where fid=?";  //删除的SQL语句，根据ID删除
	        PreparedStatement pst = null;
	        boolean isSuccess = false;
	        try {
	            pst = conn.prepareStatement(sql);
	            pst.setInt(1, fid);
	            isSuccess = pst.executeUpdate() > 0;
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }finally {
	        	SqlUtil.close(null, pst, conn);
	        }
	        return isSuccess;

	 }
	 
	 /**
	  * 查询用户
	  * @param firmName
	  * @return
	  */
	 public List<FirmEntity> selectUserByFid(String firmName) {
			Connection conn = SqlUtil.getConnection();
			String sql = "select * from firms where firmName like ?";
			PreparedStatement pst = null ;
			ResultSet rs =null;
			List<FirmEntity> lists =new ArrayList<>();
			try {
				pst = conn.prepareStatement(sql);
				pst.setString(1, "%"+firmName+"%");
				rs =pst.executeQuery();
				while(rs.next()) {
					FirmEntity u = new FirmEntity();
					u.setLogo(rs.getString("logo"));
					u.setFid(rs.getInt("fid"));
					u.setFirmName(rs.getString("firmName"));
					u.setfFile(rs.getString("fFile"));
					u.setPlace(rs.getString("place"));
					u.setTel(rs.getString("tel"));
					u.setManager(rs.getString("manager"));
					lists.add(u);
				}
			}catch (SQLException e) {
				e.printStackTrace();
			}finally {
				SqlUtil.close(rs, pst, conn);
			}
			return lists;
		}
}
