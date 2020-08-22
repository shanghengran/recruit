package com.recruit.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.recruit.entity.CommentsEntity;
import com.recruit.entity.Pager;
import com.recruit.util.SqlUtil;

	
public class CommentsDao {
	/**
	 * 查询评论总数
	 * @return
	 */
	public int selectTotalCount() {
		Connection conn = SqlUtil.getConnection();
		String sql = "select count(*) c from comments";
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
	 * 评论查询
	 * @param pager
	 * @return
	 */
	public Pager<CommentsEntity> selectComments(Pager<CommentsEntity> pager) {
		Connection conn = SqlUtil.getConnection();
		String sql = "select * from comments limit ?,?";
		PreparedStatement pst = null;
		ResultSet rs = null;
		List<CommentsEntity> list = new ArrayList<>();
		CommentsEntity comments = null;
		try{
			pst = conn.prepareStatement(sql);
			pst.setInt(1, (pager.getPageNow()-1)*pager.getPageSize());
			pst.setInt(2, pager.getPageSize());
			rs = pst.executeQuery();
			while(rs.next()) {
				comments = new CommentsEntity();
				comments.setCid(rs.getInt("cid"));
				comments.setFid(rs.getInt("fid"));
				comments.setUid(rs.getInt("uid"));
				comments.setContent(rs.getString("content"));
				comments.setSendTime(rs.getString("sendTime"));	
				list.add(comments);
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
	 * 删除评论
	 * @param cid
	 * @return
	 */
	 public boolean deleteComments(int cid){
		Connection conn =  SqlUtil.getConnection();
        String sql = "delete from comments where cid=?";  //删除的SQL语句，根据ID删除
        PreparedStatement pst = null;
        boolean isSuccess = false;
        try {
            pst = conn.prepareStatement(sql);
            pst.setInt(1, cid);
            isSuccess = pst.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return isSuccess;
    }
}
