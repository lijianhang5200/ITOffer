package com.qst.itoffer.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.qst.itoffer.bean.ApplicantBean;
import com.qst.itoffer.bean.EduBean;
import com.qst.itoffer.bean.ResumeBasicinfoBean;
import com.qst.itoffer.dao.EduDao;
import com.qst.itoffer.dao.ResumeBasicinfoDao;

public class ResumeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public ResumeServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String type = request.getServletPath();
		type = type.substring(type.lastIndexOf("/") + 1, type.lastIndexOf(".resume"));
		boolean flag = true;
		if ("pic".equals(type)) {
			ResumeBasicinfoDao resumeBasicinfoDao = new ResumeBasicinfoDao();
			ResumeBasicinfoBean resumeBasicinfoBean = getResumeBasicinfoBean(request);
			String id = request.getParameter("applicant_id");
			if (id == null || "".equals(id)) {
				flag = resumeBasicinfoDao.addHead_shot(resumeBasicinfoBean);
			} else {
				flag = resumeBasicinfoDao.updateHead_shot(resumeBasicinfoBean);
			}
		} else if ("basic".equals(type)) {
			ResumeBasicinfoDao resumeBasicinfoDao = new ResumeBasicinfoDao();
			ResumeBasicinfoBean resumeBasicinfoBean = getResumeBasicinfoBean(request);
			String id = request.getParameter("applicant_id");
			if (id.isEmpty() || "".equals(id)) {
				flag = resumeBasicinfoDao.add(resumeBasicinfoBean);
			} else {
				flag = resumeBasicinfoDao.update(resumeBasicinfoBean);
			}
		} else if ("edu".equals(type)) {
			EduDao eduDao = new EduDao();
			EduBean eduBean = getEduBean(request);
			String id = request.getParameter("id");
			if (id == null || "".equals(id)) {
				flag = eduDao.add(eduBean);
			} else {
				flag = eduDao.update(eduBean.setEduid(Integer.parseInt(id)));
			}
		} else if ("deledu".equals(type)) {
			EduDao eduDao = new EduDao();
			EduBean eduBean = getEduBean(request);
			String id = request.getParameter("eduid");
			if (id != null) {
				flag = eduDao.delById(Integer.parseInt(id));
			}
		}
		
		if (flag) {
			response.sendRedirect("applicant/resume.html");
		} else {
			request.setAttribute("message", "简历信息错误，请重试！");
			request.getRequestDispatcher("error.jsp").forward(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

	private EduBean getEduBean(HttpServletRequest request) {
		EduBean bean = new EduBean();
		int applicantid = ((ApplicantBean) request.getSession().getAttribute("SESSION_LOGIN_USER")).getApplicant_id();
		bean.setApplicantid(applicantid);
		bean.setSchool(request.getParameter("school"));
		bean.setTime(request.getParameter("time"));
		bean.setEducation(request.getParameter("education"));
		bean.setMajor(request.getParameter("major"));
		return bean;
	}

	private ResumeBasicinfoBean getResumeBasicinfoBean(HttpServletRequest request) {
		ResumeBasicinfoBean r = new ResumeBasicinfoBean();
		int applicant_id = ((ApplicantBean) request.getSession().getAttribute("SESSION_LOGIN_USER")).getApplicant_id();
		if (applicant_id != 0) {
			r.setApplicant_id(applicant_id);
		}
		String gender = request.getParameter("gender");
		if (gender != null) {
			r.setGender(Integer.parseInt(gender));
		}
		String realname = request.getParameter("realname");
		if (realname != null) {
			r.setRealname(realname);
		}
		String birthday = request.getParameter("birthday");
		if (birthday != null) {
			r.setBirthday(birthday);
		}
		String current_loc = request.getParameter("current_loc");
		if (current_loc != null) {
			r.setCurrent_loc(current_loc);
		}
		String resident_loc = request.getParameter("resident_loc");
		if (resident_loc != null) {
			r.setResident_loc(resident_loc);
		}
		String telephone = request.getParameter("telephone");
		if (telephone != null) {
			r.setTelephone(telephone);
		}
		String email = request.getParameter("email");
		if (email != null) {
			r.setEmail(email);
		}
		String job_intension = request.getParameter("job_intension");
		if (job_intension != null) {
			r.setJob_intension(job_intension);
		}
		String job_experience = request.getParameter("job_experience");
		if (job_experience != null) {
			r.setJob_experience(job_experience);
		}

		String filename = request.getParameter("filename");
		if (filename != null) {
			r.setHead_shot(filename);
		}
		return r;
	}

}
