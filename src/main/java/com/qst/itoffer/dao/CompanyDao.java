package com.qst.itoffer.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.qst.itoffer.bean.CompanyBean;
import com.qst.itoffer.util.BaiDuPage;
import com.qst.itoffer.util.DBUtil;

public class CompanyDao {
	private Connection conn = null;
	private PreparedStatement pstm = null;
	private ResultSet rs = null;
	
	public List<CompanyBean> getAll() {
		List<CompanyBean> list = new ArrayList<CompanyBean>();
		conn = DBUtil.getConnect();
		String sql = "select * from tb_company";
		try {
			pstm = conn.prepareStatement(sql);
			rs = pstm.executeQuery();
			while (rs.next()) {
				CompanyBean companyBean = new CompanyBean().setCompany_id(rs.getInt("COMPANY_ID"))
						.setCompany_name(rs.getString("COMPANY_NAME")).setCompany_area(rs.getString("COMPANY_AREA"))
						.setCompany_size(rs.getString("COMPANY_SIZE")).setCompany_type(rs.getInt("COMPANY_TYPE"))
						.setCompany_brief(rs.getString("COMPANY_BRIEF")).setCompany_state(rs.getInt("COMPANY_STATE"))
						.setCompany_sort(rs.getInt("COMPANY_SORT")).setCompany_viewnum(rs.getInt("COMPANY_VIEWNUM"))
						.setCompany_pic(rs.getString("COMPANY_PIC"));
				list.add(companyBean);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBUtil.close(rs, pstm, conn);
		}
		return list;
	}

	public List<CompanyBean> getPageList(int pagenum) {
		List<CompanyBean> list = new ArrayList<CompanyBean>();
		conn = DBUtil.getConnect();
		String sql = "select * from tb_company limit ?,?";
		try {
			pstm = conn.prepareStatement(sql);
			pstm.setInt(1, (pagenum -1) * BaiDuPage.pagelistnum);
			pstm.setInt(2, BaiDuPage.pagelistnum);
			rs = pstm.executeQuery();
			while (rs.next()) {
				CompanyBean companyBean = new CompanyBean().setCompany_id(rs.getInt("COMPANY_ID"))
						.setCompany_name(rs.getString("COMPANY_NAME")).setCompany_area(rs.getString("COMPANY_AREA"))
						.setCompany_size(rs.getString("COMPANY_SIZE")).setCompany_type(rs.getInt("COMPANY_TYPE"))
						.setCompany_brief(rs.getString("COMPANY_BRIEF")).setCompany_state(rs.getInt("COMPANY_STATE"))
						.setCompany_sort(rs.getInt("COMPANY_SORT")).setCompany_viewnum(rs.getInt("COMPANY_VIEWNUM"))
						.setCompany_pic(rs.getString("COMPANY_PIC"));
				list.add(companyBean);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBUtil.close(rs, pstm, conn);
		}
		return list;
	}
	
	public CompanyBean getById(int id) {
		CompanyBean companyBean = null;
		conn = DBUtil.getConnect();
		String sql = "select * from tb_company where COMPANY_ID=?";
		try {
			pstm = conn.prepareStatement(sql);
			pstm.setInt(1, id);
			rs = pstm.executeQuery();
			if (rs.next()) {
				companyBean = new CompanyBean().setCompany_id(rs.getInt("COMPANY_ID"))
						.setCompany_name(rs.getString("COMPANY_NAME")).setCompany_area(rs.getString("COMPANY_AREA"))
						.setCompany_size(rs.getString("COMPANY_SIZE")).setCompany_type(rs.getInt("COMPANY_TYPE"))
						.setCompany_brief(rs.getString("COMPANY_BRIEF")).setCompany_state(rs.getInt("COMPANY_STATE"))
						.setCompany_sort(rs.getInt("COMPANY_SORT")).setCompany_viewnum(rs.getInt("COMPANY_VIEWNUM"))
						.setCompany_pic(rs.getString("COMPANY_PIC"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBUtil.close(rs, pstm, conn);
		}
		return companyBean;
	}
}
