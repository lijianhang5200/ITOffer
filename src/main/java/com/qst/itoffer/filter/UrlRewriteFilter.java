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
		// place your code here
		String url = ((HttpServletRequest)request).getServletPath().toLowerCase();
		url = url.replaceAll(".html",".jsp");
		url = url.replaceAll(".xhtml",".jsp");
		url = url.replaceAll(".shtml",".jsp");
		url = url.replaceAll(".asp",".jsp");
		url = url.replaceAll(".php",".jsp");
		if(url.lastIndexOf(".do")>0){
			url = "/UserServlet?type="+url.substring(url.lastIndexOf("/")+1,url.lastIndexOf(".do"));
		}
		request.getRequestDispatcher(url).forward(request, response);
	}

	public void init(FilterConfig fConfig) throws ServletException {
	}

}
