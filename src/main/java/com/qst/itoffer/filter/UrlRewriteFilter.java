package com.qst.itoffer.filter;
/*
 * @功能：将一些url进行重写
 */
import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;

public class UrlRewriteFilter implements Filter {

    public UrlRewriteFilter() {
    }

	public void destroy() {
	}

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		String url = ((HttpServletRequest)request).getServletPath().toLowerCase();
		url = url.replaceAll(".html",".jsp");
		url = url.replaceAll(".asp",".jsp");
		url = url.replaceAll(".php",".jsp");
		url = url.replaceAll(".htm",".jsp");
		request.getRequestDispatcher(url).forward(request, response);
	}

	public void init(FilterConfig fConfig) throws ServletException {
	}

}
