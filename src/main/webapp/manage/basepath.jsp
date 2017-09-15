<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
String basePath = "" + request.getScheme() + "://"+request.getServerName();
if(request.getServerPort()!=80){
	basePath += ":" + request.getServerPort();
}
basePath += request.getContextPath()+"/";
%>
<base href="<%=basePath%>">