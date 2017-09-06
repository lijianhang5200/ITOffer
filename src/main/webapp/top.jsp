<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%-- <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> --%>
<div class="head">
	<div class="head_area">
		<div class="head_nav">
			<ul>
				<li><img src="images/nav_inc1.png" />
					<a href="index.html" target="_parent">首页</a>
				</li>
				<li><img src="images/nav_inc2.png" />
					<a href="#">成功案例</a>
				</li>
				<li><img src="images/nav_inc3.png" />
					<a href="#">关于锐聘</a>
				</li>
			</ul>
		</div>
		<div class="head_logo"><img src="images/head_logo.png" /></div>
		<div class="head_user">
			<%-- <c:if test="${sessionScope.user != null}">
				<a href="applicant/resume.html">${sessionScope.user.applicant_email }</a>
				<a href="logout.do">退出</a>
			</c:if>
			<c:if test="${sessionScope.user==null}">
				<a href="login.html"><span class="type1">登录</span></a>
				<a href="register.html"><span class="type2">注册</span></a>
			</c:if> --%>
		</div>
		<div class="clear"></div>
	</div>
</div>
<div class="top_main">
	<div class="top_logo"><img src="images/main_logo.png" /></div>
	<div class="top_instr">提供岗前培训的IT职位</div>
	<div class="top_tel"><img src="images/it-phone.png" /></div>
	<div class="clear"></div>
</div>