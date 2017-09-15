package com.qst.itoffer.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.qst.itoffer.bean.EduBean;
import com.qst.itoffer.util.DBUtil;

public class EduDao {
	private Connection conn = null;
	private PreparedStatement pstm = null;
	private ResultSet rs = null;

	public boolean add(EduBean eduBean) {
		conn = DBUtil.getConnect();
		String sql = "insert into tb_edu values(null,?,?,?,?,?)";
		int i = 0;
		try {
			pstm = conn.prepareStatement(sql);
			pstm.setInt(1, eduBean.getApplicantid());
			pstm.setString(2, eduBean.getSchool());
			pstm.setString(3, eduBean.getTime());
			pstm.setString(4, eduBean.getEducation());
			pstm.setString(5, eduBean.getMajor());
			i = pstm.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBUtil.close(rs, pstm, conn);
		}
		return i > 0;
	}

	public boolean update(EduBean eduBean) {
		conn = DBUtil.getConnect();
		String sql = "update tb_edu set school=?,time=?,education=?,major=? where edu_id=?";
		int i = 0;
		try {
			pstm = conn.prepareStatement(sql);
			pstm.setString(1, eduBean.getSchool());
			pstm.setString(2, eduBean.getTime());
			pstm.setString(3, eduBean.getEducation());
			pstm.setString(4, eduBean.getMajor());
			pstm.setInt(5, eduBean.getEduid());
			i = pstm.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBUtil.close(rs, pstm, conn);
		}
		return i > 0;
	}

	public EduBean getById(int id) {
		EduBean bean = null;
		conn = DBUtil.getConnect();
		String sql = "select * from tb_edu where edu_id = ?";
		try {
			pstm = conn.prepareStatement(sql);
			pstm.setInt(1, id);
			rs = pstm.executeQuery();
			if (rs.next()) {
				bean = new EduBean().setEduid(rs.getInt("edu_id")).setApplicantid(rs.getInt("applicant_id"))
						.setSchool(rs.getString("school")).setTime(rs.getString("time"))
						.setEducation(rs.getString("education")).setMajor(rs.getString("major"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBUtil.close(rs, pstm, conn);
		}
		return bean;
	}

	public List<EduBean> getByApplicantId(int applicantid) {
		List<EduBean> list = new ArrayList<EduBean>();
		conn = DBUtil.getConnect();
		String sql = "select * from tb_edu where applicant_id = ?";
		try {
			pstm = conn.prepareStatement(sql);
			pstm.setInt(1, applicantid);
			rs = pstm.executeQuery();
			while (rs.next()) {
				EduBean bean = new EduBean().setEduid(rs.getInt("edu_id")).setApplicantid(rs.getInt("applicant_id"))
						.setSchool(rs.getString("school")).setTime(rs.getString("time"))
						.setEducation(rs.getString("education")).setMajor(rs.getString("major"));
				list.add(bean);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBUtil.close(rs, pstm, conn);
		}
		return list;
	}

	public boolean delById(int id) {
		conn = DBUtil.getConnect();
		int i = 0;
		String sql = "delete from tb_edu where edu_id = ?";
		try {
			pstm = conn.prepareStatement(sql);
			pstm.setInt(1, id);
			i = pstm.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBUtil.close(rs, pstm, conn);
		}
		return i > 0;
	}

}
