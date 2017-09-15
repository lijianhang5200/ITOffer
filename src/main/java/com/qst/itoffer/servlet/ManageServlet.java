package com.qst.itoffer.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.qst.itoffer.bean.AccountBean;
import com.qst.itoffer.bean.ApplicantBean;
import com.qst.itoffer.dao.AccountDao;

public class ManageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public ManageServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		String type = request.getServletPath();
		type = type.substring(type.lastIndexOf("/")+1, type.lastIndexOf(".manage"));
		if ("login".equals(type)) {
			String loginName = request.getParameter("userLogname").trim();
			String password = request.getParameter("userPwd").trim();
			String vcode = request.getParameter("validateCode").trim().toLowerCase();
			Cookie[] cookies = request.getCookies();
			String codesys = null;
			for (Cookie c : cookies) {
				if ("Vcode".equals(c.getName())) {
					codesys = c.getValue();
					break;
				}
			}
			if(loginName == null || "".equals(loginName)){
				request.setAttribute("message", "账号不能为空");
				request.getRequestDispatcher("error.jsp").forward(request, response);
			} else if(password == null || "".equals(password)){
				request.setAttribute("message", "密码不能为空");
				request.getRequestDispatcher("error.jsp").forward(request, response);
			} else if(vcode == null || "".equals(vcode)){
				request.setAttribute("message", "验证码不能为空");
				request.getRequestDispatcher("error.jsp").forward(request, response);
			} else if (codesys == null) {
				// // 验证码过期
				request.setAttribute("message", "验证码过期");
				request.getRequestDispatcher("error.jsp").forward(request, response);
			} else if (codesys.toLowerCase().equals(vcode)) {
				// // 验证码正确
				AccountDao accountDao = new AccountDao();
				AccountBean accountBean = accountDao.getByLoginName(loginName);
				if(accountBean==null){
					request.setAttribute("message", "用户不存在");
					request.getRequestDispatcher("error.jsp").forward(request, response);
				} else if (accountBean.getPassword().equals(password)) {
					session.setAttribute("SESSION_ADMIN_ACCOUNT", accountBean);
					response.sendRedirect("manage/main.html");
				} else {
					request.setAttribute("message", "密码错误");
					request.getRequestDispatcher("error.jsp").forward(request, response);
				}
			} else {
				// // 验证码错误
				request.setAttribute("message", "验证码错误");
				request.getRequestDispatcher("error.jsp").forward(request, response);
			}
		} else if ("logout".equals(type)) {

		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
