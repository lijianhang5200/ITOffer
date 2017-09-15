package com.qst.itoffer.listener;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

public class OnlineListener implements HttpSessionListener {
	private int onlineNum = 0;

	public OnlineListener() {
	}

	public void sessionCreated(HttpSessionEvent hse) {
		onlineNum++;
		HttpSession session = hse.getSession();
		ServletContext sc = session.getServletContext();
		sc.setAttribute("onlineNum", onlineNum);
		// 第一次标记
		session.setAttribute("first", "true");
	}

	public void sessionDestroyed(HttpSessionEvent hse) {
		onlineNum--;
		hse.getSession().getServletContext().setAttribute("onlineNum", onlineNum);
	}
}
