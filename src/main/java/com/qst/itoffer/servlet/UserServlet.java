package com.qst.itoffer.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.qst.itoffer.bean.ApplicantBean;
import com.qst.itoffer.dao.ApplicantDao;

public class UserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public UserServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		ApplicantDao appDao = new ApplicantDao();
		HttpSession session = request.getSession();
		String type = request.getParameter("type");
		if ("login".equals(type)) {
			//登录成功
			String email = request.getParameter("email").trim();
			String password = request.getParameter("password").trim();
			ApplicantBean appBean = appDao.getAdminByEmail(email);
			if (appBean == null) {
				// 没有查到用户
				request.setAttribute("message", "没有查到用户");
				request.getRequestDispatcher(request.getContextPath()+"/error.jsp").forward(request, response);
			} else if (!password.equals(appBean.getApplicant_pwd())) {
				// // 密码错误
				request.setAttribute("message", "密码错误");
				request.getRequestDispatcher(request.getContextPath()+"/error.jsp").forward(request, response);
			} else {
				// // 全部正确，登录成功，跳转到自己的库页面
				session.setAttribute("user", appBean);
				response.sendRedirect(request.getContextPath()+"/index.html");
			}
		} else if ("logout".equals(type)) {
			//退出登录
			session.setAttribute("user", null);
			response.sendRedirect(request.getContextPath()+"/regsuccess.html");
		} else if ("register".equals(type)) {
			//注册成功
			String email = request.getParameter("email").trim();
			String password = request.getParameter("password").trim();
			String vcode = request.getParameter("vcode").trim().toLowerCase();
			Cookie[] cookies = request.getCookies();
			String codesys = null;
			for (Cookie c : cookies) {
				if ("Vcode".equals(c.getName())) {
					codesys = c.getValue();
					break;
				}
			}
			if (codesys == null) {
				// 验证码过期
				request.setAttribute("message", "验证码过期");
				request.getRequestDispatcher("error.jsp").forward(request, response);
			} else if (codesys.toLowerCase().equals(vcode)) {
				// 验证码正确
				ApplicantBean appBean = new ApplicantBean().setApplicant_email(email).setApplicant_pwd(password);
				if (appDao.add(appBean)) {
					response.sendRedirect(request.getContextPath()+"/regsuccess.html");
				} else {
					request.setAttribute("message", "添加失败请重试");
					request.getRequestDispatcher("error.jsp").forward(request, response);
				}
			} else {
				// 验证码错误
				request.setAttribute("message", "验证码错误");
				request.getRequestDispatcher(request.getContextPath()+"/error.jsp").forward(request, response);
			}
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
