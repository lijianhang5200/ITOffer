package com.qst.itoffer.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.qst.itoffer.bean.JobBean;
import com.qst.itoffer.util.DBUtil;

public class JobDao {
	private Connection conn = null;
	private PreparedStatement pstm = null;
	private ResultSet rs = null;
	
	public List<JobBean> getTwo(int company_id){
		List<JobBean> list = new ArrayList<JobBean>();
		conn = DBUtil.getConnect();
		String sql = "select * from tb_job where COMPANY_ID=? limit 2";
		try {
			pstm = conn.prepareStatement(sql);
			pstm.setInt(1, company_id);
			rs = pstm.executeQuery();
			while(rs.next()){
				JobBean jobBean = new JobBean().setJob_id(rs.getInt("JOB_ID")).setCompany_id(rs.getInt("COMPANY_ID"))
						.setJob_name(rs.getString("JOB_NAME")).setJob_hiringnum(rs.getInt("JOB_HIRINGNUM"))
						.setJob_salary(rs.getString("JOB_SALARY")).setJob_area(rs.getString("JOB_AREA"))
						.setJob_desc(rs.getString("JOB_DESC")).setJob_endtime(rs.getDate("JOB_ENDTIME"))
						.setJob_status(rs.getInt("JOB_STATE"));
				list.add(jobBean);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBUtil.close(rs, pstm, conn);
		}
		return list;
	}
}
