package com.qst.itoffer.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.qst.itoffer.bean.AccountBean;
import com.qst.itoffer.util.DBUtil;

public class AccountDao {
	private Connection conn = null;
	private PreparedStatement pstm = null;
	private ResultSet rs = null;

//	public boolean add(AccountBean account) {
//		conn = DBUtil.getConnect();
//		String sql = "insert into admin_account values(null,?,?,?,?,?,?,?,?)";
//		int i = 0;
//		try {
//			pstm = conn.prepareStatement(sql);
//			pstm.setString(1, app.getApplicant_email());
//			pstm.setString(2, app.getApplicant_pwd());
//			pstm.setTimestamp(3, new Timestamp(System.currentTimeMillis()));
//			i = pstm.executeUpdate();
//		} catch (SQLException e) {
//			e.printStackTrace();
//		} finally {
//			DBUtil.close(rs, pstm, conn);
//		}
//		return i > 0;
//	}

	public AccountBean getByLoginName(String loginName) {
		AccountBean bean = null;
		conn = DBUtil.getConnect();
		String sql = "select * from admin_account where u_login_name = ?";
		try {
			pstm = conn.prepareStatement(sql);
			pstm.setString(1, loginName);
			rs = pstm.executeQuery();
			if (rs.next()) {
				bean = new AccountBean().setAm_id(rs.getInt("am_id")).setLogin_name(rs.getString("u_login_name"))
						.setPassword(rs.getString("u_password")).setName(rs.getString("am_name")).setMobile(rs.getString("mobile"))
						.setStatus(rs.getInt("u_status")).setExpire_date(rs.getDate("expire_date")).setUserrole(rs.getInt("userrole"))
						.setCommpany_id(rs.getInt("COMPANY_ID"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBUtil.close(rs, pstm, conn);
		}
		return bean;
	}

	public boolean isExist(String LoginName) {
		conn = DBUtil.getConnect();
		String sql = "select * from tb_applicant where APPLICANT_EMAIL=?";
		boolean flag = false;
		try {
			pstm = conn.prepareStatement(sql);
			pstm.setString(1, LoginName);
			rs = pstm.executeQuery();
			if (rs.next()) {
				flag = true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBUtil.close(rs, pstm, conn);
		}
		return flag;
	}
}
