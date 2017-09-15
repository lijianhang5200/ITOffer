package com.qst.itoffer.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.qst.itoffer.bean.ResumeBasicinfoBean;
import com.qst.itoffer.util.BaiDuPage;
import com.qst.itoffer.util.DBUtil;

public class ResumeBasicinfoDao {
	private Connection conn = null;
	private PreparedStatement pstm = null;
	private ResultSet rs = null;
	
	public boolean add(ResumeBasicinfoBean resumeBasicinfoBean){
		conn = DBUtil.getConnect();
		String sql = "insert into tb_resume_basicinfo(APPLICANT_ID,REALNAME,GENDER,BIRTHDAY,CURRENT_LOC,"
				+ "RESIDENT_LOC,TELEPHONE,EMAIL,JOB_INTENSION,JOB_EXPERIENCE) values(?,?,?,?,?,?,?,?,?,?)";
		int i=0;
		try {
			pstm = conn.prepareStatement(sql);
			pstm.setInt(1, resumeBasicinfoBean.getApplicant_id());
			pstm.setString(2, resumeBasicinfoBean.getRealname());
			pstm.setInt(3, resumeBasicinfoBean.getGender());
			pstm.setString(4, resumeBasicinfoBean.getBirthday());
			pstm.setString(5, resumeBasicinfoBean.getCurrent_loc());
			pstm.setString(6, resumeBasicinfoBean.getResident_loc());
			pstm.setString(7, resumeBasicinfoBean.getTelephone());
			pstm.setString(8, resumeBasicinfoBean.getEmail());
			pstm.setString(9, resumeBasicinfoBean.getJob_intension());
			pstm.setString(10, resumeBasicinfoBean.getJob_experience());
			i = pstm.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBUtil.close(rs, pstm, conn);
		}
		return i>0;
	}
	
	public boolean addHead_shot(ResumeBasicinfoBean resumeBasicinfoBean){
		conn = DBUtil.getConnect();
		String sql = "insert into tb_resume_basicinfo(APPLICANT_ID,HEAD_SHOT) value(?,?)";
		int i=0;
		try {
			pstm = conn.prepareStatement(sql);
			pstm.setInt(1, resumeBasicinfoBean.getApplicant_id());
			pstm.setString(2, resumeBasicinfoBean.getHead_shot());
			i = pstm.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBUtil.close(rs, pstm, conn);
		}
		return i>0;
	}
	
	public boolean update(ResumeBasicinfoBean resumeBasicinfoBean){
		conn = DBUtil.getConnect();
		String sql = "update tb_resume_basicinfo set REALNAME=?,GENDER=?,BIRTHDAY=?,CURRENT_LOC=?,"
				+ "RESIDENT_LOC=?,TELEPHONE=?,EMAIL=?,JOB_INTENSION=?,JOB_EXPERIENCE=? where APPLICANT_ID=?";
		int i=0;
		try {
			pstm = conn.prepareStatement(sql);
			pstm.setString(1, resumeBasicinfoBean.getRealname());
			pstm.setInt(2, resumeBasicinfoBean.getGender());
			pstm.setString(3, resumeBasicinfoBean.getBirthday());
			pstm.setString(4, resumeBasicinfoBean.getCurrent_loc());
			pstm.setString(5, resumeBasicinfoBean.getResident_loc());
			pstm.setString(6, resumeBasicinfoBean.getTelephone());
			pstm.setString(7, resumeBasicinfoBean.getEmail());
			pstm.setString(8, resumeBasicinfoBean.getJob_intension());
			pstm.setString(9, resumeBasicinfoBean.getJob_experience());
			pstm.setInt(10, resumeBasicinfoBean.getApplicant_id());
			i = pstm.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBUtil.close(rs, pstm, conn);
		}
		return i>0;
	}
	
	public boolean updateHead_shot(ResumeBasicinfoBean resumeBasicinfoBean){
		conn = DBUtil.getConnect();
		String sql = "update tb_resume_basicinfo set HEAD_SHOT=? where APPLICANT_ID=?";
		int i=0;
		try {
			pstm = conn.prepareStatement(sql);
			pstm.setString(1, resumeBasicinfoBean.getHead_shot());
			pstm.setInt(2, resumeBasicinfoBean.getApplicant_id());
			i = pstm.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBUtil.close(rs, pstm, conn);
		}
		return i>0;
	}
	
	public ResumeBasicinfoBean get(int id) {
		ResumeBasicinfoBean resumeBasicinfoBean = null;
		conn = DBUtil.getConnect();
		String sql = "select * from tb_resume_basicinfo where APPLICANT_ID=?";
		try {
			pstm = conn.prepareStatement(sql);
			pstm.setInt(1, id);
			rs = pstm.executeQuery();
			if(rs.next()){
				resumeBasicinfoBean = new ResumeBasicinfoBean().setBasicinfo_id(rs.getInt("BASICINFO_ID"))
						.setApplicant_id(rs.getInt("APPLICANT_ID")).setRealname(rs.getString("REALNAME")).setGender(rs.getInt("GENDER"))
						.setBirthday(rs.getString("BIRTHDAY")).setCurrent_loc(rs.getString("CURRENT_LOC")).setResident_loc(rs.getString("RESIDENT_LOC"))
						.setTelephone(rs.getString("TELEPHONE")).setEmail(rs.getString("EMAIL")).setJob_intension(rs.getString("JOB_INTENSION"))
						.setJob_experience(rs.getString("JOB_EXPERIENCE")).setHead_shot(rs.getString("HEAD_SHOT"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBUtil.close(rs, pstm, conn);
		}
		return resumeBasicinfoBean;
	}
	public List<ResumeBasicinfoBean> getPageList(int pagenum) {
		List<ResumeBasicinfoBean> list = new ArrayList<ResumeBasicinfoBean>();
		conn = DBUtil.getConnect();
		String sql = "select * from tb_resume_basicinfo limit ?,?";
		try {
			pstm = conn.prepareStatement(sql);
			pstm.setInt(1, (pagenum -1) * BaiDuPage.pagelistnum);
			pstm.setInt(2, BaiDuPage.pagelistnum);
			rs = pstm.executeQuery();
			while (rs.next()){
				ResumeBasicinfoBean resumeBasicinfoBean = new ResumeBasicinfoBean().setBasicinfo_id(rs.getInt("BASICINFO_ID"))
						.setApplicant_id(rs.getInt("APPLICANT_ID")).setRealname(rs.getString("REALNAME")).setGender(rs.getInt("GENDER"))
						.setBirthday(rs.getString("BIRTHDAY")).setCurrent_loc(rs.getString("CURRENT_LOC")).setResident_loc(rs.getString("RESIDENT_LOC"))
						.setTelephone(rs.getString("TELEPHONE")).setEmail(rs.getString("EMAIL")).setJob_intension(rs.getString("JOB_INTENSION"))
						.setJob_experience(rs.getString("JOB_EXPERIENCE")).setHead_shot(rs.getString("HEAD_SHOT"));
				list.add(resumeBasicinfoBean);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBUtil.close(rs, pstm, conn);
		}
		return list;
	}
}
