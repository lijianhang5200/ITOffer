package com.qst.itoffer.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.qst.itoffer.bean.CompanyBean;
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
			while(rs.next()){
				CompanyBean companyBean = new CompanyBean().setCompany_id(rs.getInt("COMPANY_ID")).setCompany_name(rs.getString("COMPANY_NAME"))
						.setCompany_area(rs.getString("COMPANY_AREA")).setCompany_size("COMPANY_SIZE").setCompany_type(rs.getString("COMPANY_TYPE"))
						.setCompany_brief(rs.getString("COMPANY_BRIEF")).setCompany_state(rs.getInt("COMPANY_STATE"))
						.setCompany_sort(rs.getInt("COMPANY_SORT")).setCompany_viewnum("COMPANY_VIEWNUM").setCompany_pic(rs.getString("COMPANY_PIC"));
				list.add(companyBean);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBUtil.close(rs, pstm, conn);
		}
		return list;
	}
}
