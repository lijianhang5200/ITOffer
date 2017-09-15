package com.qst.itoffer.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.qst.itoffer.bean.JobApplyBean;
import com.qst.itoffer.util.DBUtil;

public class JobApplyDao {
	private Connection conn = null;
	private PreparedStatement pstm = null;
	private ResultSet rs = null;
	
	public boolean add(JobApplyBean bean) {
		conn = DBUtil.getConnect();
		String sql = "insert into tb_jobapply values(null,?,?,?,?)";
		int i=0;
		try {
			pstm = conn.prepareStatement(sql);
			pstm.setInt(1, bean.getJob_id());
			pstm.setInt(2, bean.getApplicant_id());
			pstm.setTimestamp(3, DBUtil.utilDateToSqlTimestamp(new Date()));
			pstm.setInt(4, 0);
			i = pstm.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBUtil.close(rs, pstm, conn);
		}
		return i>0;
	}

	public boolean isApply(JobApplyBean bean) {
		conn = DBUtil.getConnect();
		String sql = "select * from tb_jobapply where JOB_ID=? and APPLICANT_ID=?";
		int i=0;
		try {
			pstm = conn.prepareStatement(sql);
			pstm.setInt(1, bean.getJob_id());
			pstm.setInt(2, bean.getApplicant_id());
			rs = pstm.executeQuery();
			if(rs.next()){
				++i;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBUtil.close(rs, pstm, conn);
		}
		return i>0;
	}
	
	public boolean delete(int jobid) {
		conn = DBUtil.getConnect();
		String sql = "delete from tb_jobapply where JOB_ID=?";
		int i=0;
		try {
			pstm = conn.prepareStatement(sql);
			pstm.setInt(1, jobid);
			i = pstm.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBUtil.close(rs, pstm, conn);
		}
		return i>0;
	}
	
	public List<JobApplyBean> getPageList(int applicant_id) {
		List<JobApplyBean> list = new ArrayList<JobApplyBean>();
		conn = DBUtil.getConnect();
		String sql = "select * from tb_jobapply where APPLICANT_ID=? ";
		try {
			pstm = conn.prepareStatement(sql);
			pstm.setInt(1, applicant_id);
			rs = pstm.executeQuery();
			while(rs.next()){
				JobApplyBean bean =new JobApplyBean().setApply_id(rs.getInt("APPLY_ID")).setJob_id(rs.getInt("JOB_ID"))
						.setApplicant_id(rs.getInt("APPLICANT_ID")).setApply_date(rs.getDate("APPLY_DATE"))
						.setApply_state(rs.getInt("APPLY_STATE"));
				list.add(bean);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBUtil.close(rs, pstm, conn);
		}
		return list;
	}
}
