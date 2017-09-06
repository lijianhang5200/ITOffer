<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> --%>
<!Doctype html>
<html>

	<head>
		<title>锐聘网</title>
		<%@ include file="head.jsp" %>
		<link href="css/error.css" type="text/css" rel="stylesheet" />
	</head>

	<body>
		<div width="100%" height="100">
			<jsp:include page="top.jsp" flush="true" />
		</div>
		<div class="success_content">
			<div class="success_left">
				<div class="error"><img alt="" src="images/error.gif"></div>
				<c:if test='${requestScope.message != null}'>
					<h2 align="center">${requestScope.message }</h2>
				</c:if>
				<c:if test="${requestScope.message == null}">
					<h2 align="center">出错了！</h2>
				</c:if>
			</div>
			<div class="success_right">
				<p class="green16">错误提示信息</p>
				<p>
					<a href="javascript:window.history.go(-1);"><span class="tn-button">返回上一步</span></a>
					<a href="index.jsp"><span class="tn-button">返回首页</span></a>
				</p>
			</div>
			<div class="clear"></div>
		</div>
		<div width="100%" height="150">
			<%@ include file="foot.jsp" %>
		</div>
	</body>

</html>