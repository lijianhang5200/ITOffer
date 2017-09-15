<%@page import="com.qst.itoffer.dao.CompanyDao,com.qst.itoffer.util.DBUtil,com.qst.itoffer.util.BaiDuPage"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
CompanyDao companyDao = new CompanyDao();
String pagenumStr = request.getParameter("pagename");
int pagenum = 1;
if(null != pagenumStr){
	pagenum = Integer.parseInt(pagenumStr);
}
request.setAttribute("companylist", companyDao.getPageList(pagenum));
int count = DBUtil.getCount("tb_company");
request.setAttribute("count",count);
request.setAttribute("pagenum",pagenum);
request.setAttribute("page", BaiDuPage.getPageHtml(pagenum, (int) Math.ceil( count / (float) BaiDuPage.pagelistnum)));
%>
<!doctype html>
<html>
	<head>
		<jsp:include page="basepath.jsp" flush="true" />
		<meta charset="utf-8">
		<title>企业列表</title>
		<link href="css/manageadmin.css" rel="stylesheet" type="text/css" />
	</head>

	<body>
		<div class="place"> <span>位置：</span>
			<ul class="placeul">
				<li>
					<a href="#">首页</a>
				</li>
				<li>
					<a href="#">企业列表</a>
				</li>
			</ul>
		</div>
		<div class="rightinfo">
			<div class="tools">
				<ul class="toolbar">
					<li class="click"><span><img src="images/t01.png" /></span>
						<a href="manage/companyAdd.html">添加</a>
					</li>
					<li><span><img src="images/t03.png" /></span>
						<a href="#">删除</a>
					</li>
				</ul>
			</div>
			<table class="imgtable">
				<thead>
					<tr>
						<th><input name="" type="checkbox" value="" checked="checked" /></th>
						<th>企业名称</th>
						<th>企业所在地</th>
						<th>企业规模</th>
						<th>企业性质</th>
						<th>招聘状态</th>
						<th>显示排序</th>
						<th>浏览数</th>
						<th>操作</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${companylist }" var="item">
						<tr height="50px">
							<td><input name="" type="checkbox" value="" /></td>
							<td>${item.company_name }</td>
							<td>${item.company_area }</td>
							<td>${item.company_size }</td>
							<td>
								<c:if test="${item.company_type == 1 }">股份制企业</c:if>
								<c:if test="${item.company_type == 2 }">外资企业</c:if>
								<c:if test="${item.company_type == 3 }">合资企业</c:if>
							</td>
							<td>
								<c:if test="${item.company_state == 1 }">招聘中</c:if>
								<c:if test="${item.company_state == 2 }">已暂停</c:if>
								<c:if test="${item.company_state == 3 }">已结束</c:if>
							</td>
							<td>${item.company_sort }</td>
							<td>${item.company_viewnum }</td>
							<td>
								<a href="manage/companyAdd.html?${item.company_id }" class="tablelink">修改</a> &nbsp;&nbsp;
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