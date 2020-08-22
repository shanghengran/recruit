package com.recruit.util;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;

public class SqlUtil {
	
	private static String driver;
	private static String url;
	private static String username;
	private static String password;
	

	static {
		InputStream is = SqlUtil.class.getClassLoader().getResourceAsStream("db.properties");
		Properties properties = new Properties();
		try {
			properties.load(is);
		} catch (IOException e1) {
			e1.printStackTrace();
		}
		driver = properties.getProperty("driver");
		url = properties.getProperty("url");
		username = properties.getProperty("username");
		password = properties.getProperty("password");
		try {
			Class.forName(driver);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
	}
	/**
	 * 连接数据库
	 * @return
	 */
	public static Connection getConnection() {
		try {
			return DriverManager.getConnection(url, username, password);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}
	/**
	 * 关闭流
	 * @param rs
	 * @param pst
	 * @param conn
	 */
	public static void close(ResultSet rs,PreparedStatement pst,Connection conn) {
		if(rs != null) {
			try {
				rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		if(pst != null) {
			try {
				pst.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		if(conn != null) {
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
}