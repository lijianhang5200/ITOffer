<%@page import="com.qst.itoffer.dao.EduDao,com.qst.itoffer.bean.ResumeBasicinfoBean,com.qst.itoffer.bean.ApplicantBean,com.qst.itoffer.dao.ResumeBasicinfoDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
ApplicantBean appBean = (ApplicantBean) session.getAttribute("SESSION_LOGIN_USER");
if (appBean != null) {
	ResumeBasicinfoDao resumeBasicinfoDao = new ResumeBasicinfoDao();
	ResumeBasicinfoBean resumeBasicinfoBean = resumeBasicinfoDao.get(appBean.getApplicant_id());
	request.setAttribute("ResumeBasicinfoBean", resumeBasicinfoBean);
	EduDao eduDao = new EduDao();
	request.setAttribute("edulist", eduDao.getByApplicantId(appBean.getApplicant_id()));
}
%>
<!doctype html>
<html>

	<head>
		<title>我的简历 - 锐聘网</title>
		<%@ include file="../head.jsp" %>
		<link href="css/resume.css" type="text/css" rel="stylesheet" />
	</head>

	<body>
		<div width="100%" height="100"><jsp:include page="../top.jsp" flush="true" /></div>
		<div class="resume_con">
			<div class="status">
				<div style="float:left">
					<span style="font-size:14px">简历状态：</span>&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#666666">通过审核</span>&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#19A8B6">通过审核</span>&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#19A8B6">不通过审核</span></div>
				<div style="float:left" class="pingyu">评语</div>
				<div class="clear"></div>
			</div>
			<div class="all_resume">
				<div style="float:left">
					<span class="person_name">${requestScope.ResumeBasicinfoBean.realname }：</span>
					<p>${requestScope.ResumeBasicinfoBean.job_intension } | ${requestScope.ResumeBasicinfoBean.job_experience }| 现居山东省青岛市市南区</p>
					<p>手机：${requestScope.ResumeBasicinfoBean.telephone }</p>
					<p>QQ：43232322</p>
					<p>电子邮件：${requestScope.ResumeBasicinfoBean.email }</p>
					<p>户口所在地：山东省青岛市市南区</p>
					<p>出生日期：${requestScope.ResumeBasicinfoBean.birthday }</p>
				</div>
				<div style="float:right">
					<c:if test='${empty requestScope.ResumeBasicinfoBean.head_shot }'><img id="headpic" src="images/885220059400.jpg" width="150" height="150"></c:if>
					<c:if test='${not empty requestScope.ResumeBasicinfoBean.head_shot }'><img id="headpic" src='dfile?${requestScope.ResumeBasicinfoBean.head_shot }' width="150" height="150"></c:if>
				</div>
				<div class="clear"></div>
			</div>
			<div class="resume_title">教育经历</div>
			<div class="all_resume">
				<c:forEach items="${requestScope.edulist }" var="item">
					<p>毕业院校：${item.school } | 就读时间：${item.time } | 学历：${item.education } | 专业：${item.major }</p>
				</c:forEach>
			</div>
			<div class="resume_title">工作经历</div>
			<div class="all_resume">
				<p>java工程师 | 刚刚增加工作| 现居山东省青岛市市南区</p>
				<p>手机：13587845785</p>
				<p>QQ：43232322</p>
				<p>电子邮件：13587845@qq.com</p>
				<p>户口所在地：山东省青岛市市南区</p>
				<p>出生日期：1982/1/9</p>
			</div>
			<div class="resume_title">语言能力</div>
			<div class="all_resume">
				<p>java工程师 | 刚刚增加工作| 现居山东省青岛市市南区</p>
				<p>手机：13587845785</p>
				<p>QQ：43232322</p>
				<p>电子邮件：13587845@qq.com</p>
				<p>户口所在地：山东省青岛市市南区</p>
				<p>出生日期：1982/1/9</p>
			</div>
			<div class="resume_title">IT技能</div>
			<div class="all_resume">
				<p>java工程师 | 刚刚增加工作| 现居山东省青岛市市南区</p>
				<p>手机：13587845785</p>
				<p>QQ：43232322</p>
				<p>电子邮件：13587845@qq.com</p>
				<p>户口所在地：山东省青岛市市南区</p>
				<p>出生日期：1982/1/9</p>
			</div>
		</div>
		<div width="100%" height="150">
			<%@ include file="../foot.jsp" %>
		</div>
	</body>

</html>