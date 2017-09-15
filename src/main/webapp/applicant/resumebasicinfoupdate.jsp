<%@page import="com.qst.itoffer.bean.ResumeBasicinfoBean,com.qst.itoffer.bean.ApplicantBean,com.qst.itoffer.dao.ResumeBasicinfoDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
ApplicantBean appBean = (ApplicantBean) session.getAttribute("SESSION_LOGIN_USER");
if (appBean != null) {
	ResumeBasicinfoDao resumeBasicinfoDao = new ResumeBasicinfoDao();
	ResumeBasicinfoBean resumeBasicinfoBean = resumeBasicinfoDao.get(appBean.getApplicant_id());
	request.setAttribute("ResumeBasicinfoBean", resumeBasicinfoBean);
}
%>
<!doctype html>
<html>
	<head>
		<title>我的简历 - 锐聘网</title>
		<%@ include file="../head.jsp" %>
		<link href="css/my_resume.css" type="text/css" rel="stylesheet" />
	</head>

	<body>
		<div width="100%" height="100">
			<jsp:include page="../top.jsp" flush="true" />
		</div>
		<div class="resume_con">
			<!--tab设置-->
			<div class="user_operate">
				<ul style="float:left">
					<li>
						<a href="applicant/resume.html" class="active">我的简历</a>
					</li>
					<li>
						<a href="applicant/jobApply.html">我的申请</a>
					</li>
					<div class="clear"></div>
				</ul>
				<div class="clear"></div>
			</div>
			<!--主体部分-->
			<div class="resume_main">
				<!--左边-->
				<div class="resume_left">
					<div class="resume_title">
						<div style="float:left">基本信息</div>
					</div>
					<div class="all_resume">
						<form action="basic.resume" method="post">
							<input type="hidden" hidden="hidden" name="applicant_id" value="${requestScope.ResumeBasicinfoBean.applicant_id }">
							<div class="table_style">
								<table width="300" border="0" cellpadding="3" cellspacing="1" bgcolor="#EEEEEE">
									<tr>
										<th width="110" align="right" bgcolor="#F8F8F8">姓名：</th>
										<td bgcolor="#F8F8F8"><input type="text" name="realname" value="${requestScope.ResumeBasicinfoBean.realname }"></td>
									</tr>
								</table>
								<div class="he"></div>
								<table width="300" border="0" cellpadding="3" cellspacing="1" bgcolor="#EEEEEE">
									<tr>
										<th width="110" align="right" bgcolor="#F8F8F8">性别：</th>
										<td bgcolor="#F8F8F8">
											<c:if test='${requestScope.ResumeBasicinfoBean.gender == 0}'>
												<input type="radio" name="gender" value="1">男
												<input type="radio" name="gender" value="0" checked>女
											</c:if>
											<c:if test='${empty requestScope.ResumeBasicinfoBean.gender || requestScope.ResumeBasicinfoBean.gender == 1}'>
												<input type="radio" name="gender" value="1" checked>男
												<input type="radio" name="gender" value="0">女
											</c:if>
										</td>
									</tr>
								</table>
								<div class="he"></div>
								<table width="300" border="0" cellpadding="3" cellspacing="1" bgcolor="#EEEEEE">
									<tr>
										<th width="110" align="right" bgcolor="#F8F8F8">出生日期：</th>
										<td bgcolor="#F8F8F8"><input type="text" name="birthday" value="${requestScope.ResumeBasicinfoBean.birthday }"></td>
									</tr>
								</table>
								<div class="he"></div>
								<table width="300" border="0" cellpadding="3" cellspacing="1" bgcolor="#EEEEEE">
									<tr>
										<th width="110" align="right" bgcolor="#F8F8F8">手机：</th>
										<td bgcolor="#F8F8F8"><input type="text" name="telephone" value="${requestScope.ResumeBasicinfoBean.telephone }"></td>
									</tr>
								</table>
								<div class="he"></div>
								<table width="300" border="0" cellpadding="3" cellspacing="1" bgcolor="#EEEEEE">
									<tr>
										<th width="110" align="right" bgcolor="#F8F8F8">邮件：</th>
										<td bgcolor="#F8F8F8"><input type="text" name="email" value="${requestScope.ResumeBasicinfoBean.email }"></td>
									</tr>
								</table>
								<div class="he"></div>
								<table width="300" border="0" cellpadding="3" cellspacing="1" bgcolor="#EEEEEE">
									<tr>
										<th width="110" align="right" bgcolor="#F8F8F8">求职意向：</th>
										<td bgcolor="#F8F8F8"><input type="text" name="job_intension" value="${requestScope.ResumeBasicinfoBean.job_intension }"></td>
									</tr>
								</table>
								<div class="he"></div>
								<table width="300" border="0" cellpadding="3" cellspacing="1" bgcolor="#EEEEEE">
									<tr>
										<th width="110" align="right" bgcolor="#F8F8F8">工作经验：</th>
										<td bgcolor="#F8F8F8"><input type="text" name="job_experience" value="${requestScope.ResumeBasicinfoBean.job_experience }"></td>
									</tr>
								</table>
								<div class="he"></div>
								<div style="margin-left:100px;">
									<input type="submit" class="save1" value="保存">
									<input type="button" class="cancel2" onclick="javascript:window.history.go(-1);" value="取消">
								</div>
							</div>
						</form>
						<div style="float:right" class="uploade">
							<c:if test='${empty requestScope.ResumeBasicinfoBean.head_shot }'><img src="images/person_img.jpg"></c:if>
							<c:if test='${not empty requestScope.ResumeBasicinfoBean.head_shot }'><img id="headpic" src='dfile?${requestScope.ResumeBasicinfoBean.head_shot }' width="150" height="150"></c:if>
							
							<div align="center">
								<a href="applicant/resumeBasicInfoPicUpload.html" class="uploade_btn">更换照片</a>
							</div>
						</div>
						<div class="clear"></div>
					</div>
				</div>
				<!--右边-->
				<div width="100%" height="100">
					<jsp:include page="resume_right.jsp" flush="true" />
				</div>
				<div style="clear:both"></div>
			</div>
		</div>

		<div width="100%" height="150">
			<%@ include file="../foot.jsp" %>
		</div>
	</body>

</html>