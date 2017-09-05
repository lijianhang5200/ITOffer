package com.qst.itoffer.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class DBUtil {
	public static final String user = "root";
	public static final String pwd = "0";
	public static final String url = "jdbc:mysql://localhost:3306/itoffer";
	//静态加载驱动
	static {
		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
	}
	//获取数据库连接
	public static Connection getConnect() {
		Connection conn = null;
		try {
			conn = DriverManager.getConnection(url, user, pwd);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return conn;
	}
	//关闭对数据库的连接
	public static void close(ResultSet rs, Statement pstm, Connection conn) {
		if (rs != null) {
			try {
				rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		if (pstm != null) {
			try {
				pstm.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		if (conn != null) {
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
	//获取总共数据量
	public static int getCount(String table, String str_where) {
		Connection conn = getConnect();
		String sql = "select count(*) from " + table + str_where;
		PreparedStatement stm = null;
		ResultSet rs = null;
		int count = 0;
		try {
			stm = conn.prepareStatement(sql);
			rs = stm.executeQuery();
			while (rs.next()) {
				count = rs.getInt("count(*)");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs, stm, conn);
		}
		return count;
	}
}
