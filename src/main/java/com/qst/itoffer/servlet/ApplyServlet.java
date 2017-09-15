package com.qst.itoffer.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONObject;

import com.qst.itoffer.bean.ApplicantBean;
import com.qst.itoffer.bean.JobApplyBean;
import com.qst.itoffer.dao.JobApplyDao;

@WebServlet("*.apply")
public class ApplyServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public ApplyServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String type = request.getServletPath();
		type = type.substring(type.lastIndexOf("/")+1, type.lastIndexOf(".apply"));
		String jobid = request.getParameter("jobid");
		JobApplyDao jobApplyDao = new JobApplyDao();
		JSONObject json = new JSONObject();
		if("apply".equals(type)){
			ApplicantBean appBean = (ApplicantBean) request.getSession().getAttribute("SESSION_LOGIN_USER");
			JobApplyBean bean = null;
			if (jobid != null) {
				bean = new JobApplyBean().setJob_id(Integer.parseInt(jobid)).setApplicant_id(appBean.getApplicant_id());
			}
			if(!jobApplyDao.isApply(bean)){
				if(jobApplyDao.add(bean)){
					json.put("msg", "申请成功");
				}else{
					json.put("msg", "申请失败");
				}
			}else{
				json.put("msg", "您已申请过");
			}
		}else if("del".equals(type)){
			if(jobApplyDao.delete(Integer.parseInt(jobid))){
				json.put("msg", "删除成功");
			}else{
				json.put("msg", "删除失败");
			}
		}
		response.getWriter().println(json);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
