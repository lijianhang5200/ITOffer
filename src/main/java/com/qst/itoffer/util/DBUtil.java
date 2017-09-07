package com.qst.itoffer.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.ParseException;
import java.text.SimpleDateFormat;

public class DBUtil {
	public static final String user = "root";
	public static final String pwd = "0";
	public static final String url = "jdbc:mysql://localhost:3306/itoffer";
	// 静态加载驱动
	static {
		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
	}

	// 获取数据库连接
	public static Connection getConnect() {
		Connection conn = null;
		try {
			conn = DriverManager.getConnection(url, user, pwd);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return conn;
	}

	// 关闭对数据库的连接
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

	// 获取总共数据量
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

	public static java.util.Date sqlDateToUtilDate(java.sql.Date date) {
		return new java.util.Date(date.getTime());
	}

	public static java.util.Date utilDateToSqlDate(java.util.Date date) {
		return new java.sql.Date(date.getTime());
	}

	public static java.sql.Time utilDateToSqlTime(java.util.Date date) {
		return new java.sql.Time(date.getTime());
	}

	public static java.sql.Timestamp utilDateToSqlTimestamp(java.util.Date date) {
		return new java.sql.Timestamp(date.getTime());
	}

	public static String formatDate(java.util.Date date) {
		return new SimpleDateFormat("yyyy-MM-dd").format(date);
	}

	public static String formatTime(java.util.Date date) {
		return new SimpleDateFormat("HH:mm:ss").format(date);
	}

	public static String formatDateTime(java.util.Date date) {
		return new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(date);
	}

	public static java.util.Date stringTo (String dateString){
		java.util.Date date = null;
		try {
			date = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(dateString);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return date;
	}
}
