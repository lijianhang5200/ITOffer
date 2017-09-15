<%@page import="com.qst.itoffer.dao.EduDao"%>
<%@page import="javax.servlet.jsp.tagext.TryCatchFinally"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
String idstr = request.getQueryString();
if (idstr != null) {
	try{
		int id = Integer.parseInt(idstr);
		EduDao eduDao = new EduDao();
		request.setAttribute("edu", eduDao.getById(id));
	} catch (Exception e){
	}
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
						<a href="applicant/jobapply.html">我的申请</a>
					</li>
					<li>
						<a href="applicant/changepassword.html">账号设置</a>
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
						<div style="float:left">教育经历</div>
					</div>
					<div class="all_resume">
						<form action="edu.resume" method="post">
							<input type="hidden" name="id" value="${requestScope.edu.eduid }">
							<div class="table_style">
								<table width="300" border="0" cellpadding="3" cellspacing="1" bgcolor="#EEEEEE">
									<tr>
										<th width="110" align="right" bgcolor="#F8F8F8">毕业院校：</th>
										<td bgcolor="#F8F8F8"><input type="text" name="school" value="${requestScope.edu.school }"></td>
									</tr>
								</table>
								<div class="he"></div>
								<table width="300" border="0" cellpadding="3" cellspacing="1" bgcolor="#EEEEEE">
									<tr>
										<th width="110" align="right" bgcolor="#F8F8F8">就读时间：</th>
										<td bgcolor="#F8F8F8"><input type="text" name="time" value="${requestScope.edu.time }"></td>
									</tr>
								</table>
								<div class="he"></div>
								<table width="300" border="0" cellpadding="3" cellspacing="1" bgcolor="#EEEEEE">
									<tr>
										<th width="110" align="right" bgcolor="#F8F8F8">学历：</th>
										<td bgcolor="#F8F8F8"><input type="text" name="education" value="${requestScope.edu.education }"></td>
									</tr>
								</table>
								<div class="he"></div>
								<table width="300" border="0" cellpadding="3" cellspacing="1" bgcolor="#EEEEEE">
									<tr>
										<th width="110" align="right" bgcolor="#F8F8F8">专业：</th>
										<td bgcolor="#F8F8F8"><input type="text" name="major" value="${requestScope.edu.major }"></td>
									</tr>
								</table>
								<div class="he"></div>
								<div style="margin-left:100px;"><input type="submit" class="save1" value="保存">
									<input type="button" class="cancel2" value="取消" onclick="javascript:window.history.go(-1);"></div>
							</div>
						</form>
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