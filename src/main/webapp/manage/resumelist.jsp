<%@page import="com.qst.itoffer.dao.ResumeBasicinfoDao,com.qst.itoffer.util.DBUtil,com.qst.itoffer.util.BaiDuPage"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
ResumeBasicinfoDao resumeBasicinfoDao = new ResumeBasicinfoDao();
String pagenumStr = request.getParameter("pagename");
int pagenum = 1;
if(null != pagenumStr){
	pagenum = Integer.parseInt(pagenumStr);
}
request.setAttribute("resumeBasicinfoList", resumeBasicinfoDao.getPageList(pagenum));
int count = DBUtil.getCount("tb_resume_basicinfo");
request.setAttribute("count",count);
request.setAttribute("pagenum",pagenum);
request.setAttribute("page", BaiDuPage.getPageHtml(pagenum, (int) Math.ceil( count / (float) BaiDuPage.pagelistnum)));
%>
<!doctype html>
<html>
	<head>
		<jsp:include page="basepath.jsp" flush="true" />
		<meta charset="utf-8">
		<title>简历列表</title>
		<link href="css/manageadmin.css" rel="stylesheet" type="text/css" />
	</head>
	<body>
		<div class="place"> <span>位置：</span>
			<ul class="placeul">
				<li>
					<a href="index.html">首页</a>
				</li>
				<li>简历列表</li>
			</ul>
		</div>
		<div class="rightinfo">
			<div class="tools">
				<ul class="toolbar">
					<li><span><img src="images/t03.png" /></span>
						<a href="#">删除</a>
					</li>
				</ul>
			</div>
			<table class="imgtable">
				<thead>
					<tr>
						<th><input name="" type="checkbox" value="" checked="checked" /></th>
						<th>姓名</th>
						<th>手机</th>
						<th>Email</th>
						<th>工作经验</th>
						<th>求职意向</th>
						<th>操作</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${requestScope.resumeBasicinfoList }" var="item">
						<tr height="50px">
							<td><input name="" type="checkbox" value="" /></td>
							<td>${item.realname }</td>
							<td>${item.telephone }</td>
							<td>${item.email }</td>
							<td>${item.job_experience }</td>
							<td>${item.job_intension }</td>
							<td>
								<a href="resumeView.html" class="tablelink">查看</a> &nbsp;&nbsp;
								<a href="#" class="tablelink"> 删除</a>
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<div class="pagin">
				<div class="message">共<i class="blue">${requestScope.count }</i>条记录，当前显示第<i class="blue">&nbsp;${requestScope.pagenum }&nbsp;</i>页</div>
				${requestScope.page }
			</div>
		</div>
	</body>

</html>