package com.qst.itoffer.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;

import com.qst.itoffer.bean.ApplicantBean;
import com.qst.itoffer.util.DBUtil;

public class ApplicantDao {
	private Connection conn = null;
	private PreparedStatement pstm = null;
	private ResultSet rs = null;

	public boolean add(ApplicantBean app) {
		conn = DBUtil.getConnect();
		String sql = "insert into tb_applicant values(null,?,?,?)";
		int i = 0;
		try {
			pstm = conn.prepareStatement(sql);
			pstm.setString(1, app.getApplicant_email());
			pstm.setString(2, app.getApplicant_pwd());
			pstm.setTimestamp(3, new Timestamp(System.currentTimeMillis()));
			i = pstm.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBUtil.close(rs, pstm, conn);
		}
		return i > 0;
	}

	public ApplicantBean getAdminByEmail(String email) {
		ApplicantBean appBean = null;
		conn = DBUtil.getConnect();
		String sql = "select * from tb_applicant where applicant_email = ?";
		try {
			pstm = conn.prepareStatement(sql);
			pstm.setString(1, email);
			rs = pstm.executeQuery();
			if (rs.next()) {
				appBean = new ApplicantBean().setApplicant_id(rs.getInt("APPLICANT_ID"))
						.setApplicant_email(rs.getString("APPLICANT_EMAIL"))
						.setApplicant_pwd(rs.getString("APPLICANT_PWD"))
						.setApplicant_registerdate(rs.getDate("APPLICANT_REGISTDATE"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBUtil.close(rs, pstm, conn);
		}
		return appBean;
	}

	public boolean isExist(String email) {
		conn = DBUtil.getConnect();
		String sql = "select * from tb_applicant where APPLICANT_EMAIL=?";
		boolean flag = false;
		try {
			pstm = conn.prepareStatement(sql);
			pstm.setString(1, email);
			rs = pstm.executeQuery();
			if(rs.next()){
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