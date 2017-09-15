package com.qst.itoffer.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.qst.itoffer.bean.AccountBean;

public class ManageFilter implements Filter {

	public ManageFilter() {
	}

	public void destroy() {
	}

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
//		String url = ((HttpServletRequest) request).getServletPath();
//		url = url.substring(url.lastIndexOf("/") + 1, url.lastIndexOf("."));
//		AccountBean accountBean = (AccountBean) ((HttpServletRequest) request).getSession().getAttribute("SESSION_ADMIN_ACCOUNT");
//		if (!"login".equals(url) && accountBean == null) {
//			((HttpServletResponse) response).sendRedirect("login.html");
//			return;
//		}
		chain.doFilter(request, response);
	}

	public void init(FilterConfig fConfig) throws ServletException {
	}

}
