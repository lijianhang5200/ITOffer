<%@page import="com.qst.itoffer.dao.JobDao"%>
<%@page import="com.qst.itoffer.bean.CompanyBean"%>
<%@page import="com.qst.itoffer.dao.CompanyDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String id = request.getQueryString();
if(id != null){
	CompanyDao companyDao = new CompanyDao();
	JobDao jobDao = new JobDao();
	CompanyBean bean =(CompanyBean) companyDao.getById(Integer.parseInt(id));
	request.setAttribute("company", bean);
	request.setAttribute("joblist", jobDao.getAll(bean.getCompany_id()));
}
%>
<!DOCTYPE html>
<html>

	<head>
		<title>“锐聘之星”软件设计大赛 - 锐聘网</title>
		<%@ include file="../head.jsp" %>
		<link href="css/company.css" type="text/css" rel="stylesheet" />
	</head>

	<body>
		<div width="100%" height="100">
			<jsp:include page="../top.jsp" flush="true" />
		</div>
		<div class="tn-grid">
			<div class="it-com-keyimg">
				<div class="tn-widget-content"> <img src="dfile?${requestScope.company.company_pic }" /> </div>
			</div>
		</div>
		<div class="clear"></div>
		<div class="tn-grid">
			<div class="tn-widget-content">
				<div class="tn-box-content">
					<div class="tn-helper-clearfix">
						<div class="it-main2">
							<div class="it-ctn-heading">
								<div class="it-title-line"> <span> <em> ${item.company_viewnum } </em> 浏览 </span>
									<h3> 企业简介 </h3>
								</div>
							</div>
							<div class="it-com-textnote"> <span class="kuai"> 行业：计算机软件 </span> <span class="kuai"> 所在地：${requestScope.company.company_area } </span> <span class="kuai"> 规模：${requestScope.company.company_size } </span>
							<span class="kuai"> 性质：
								<c:if test="${requestScope.company.company_type == 1 }">股份制企业</c:if>
								<c:if test="${requestScope.company.company_type == 2 }">外资企业</c:if>
								<c:if test="${requestScope.company.company_type == 3 }">合资企业</c:if>
							</span>
							<div class="it-company-text">
								${requestScope.company.company_brief }
							</div>
							<p class="tn-helper-right">
								<a href="/Home/SuccessCases?companyId=288" target="_blank" class="tn-action"> <span class="tn-icon"> </span> <span class="tn-action-text"> 成功案例 </span> </a>
							</p>
						</div>
					</div>
				</div>
			</div>

			<input type="hidden" id="videoListCompanyId" value="151" />
			<input type="hidden" id="companyTotalVideoCount" value='1' />
			<div class="it-content-seqbox">
				<div id="morejob">
					<div class="it-ctn-heading">
						<div class="it-title-line">
							<h3> 职位 </h3>
						</div>
					</div>
					<!--职位列表-->
					<c:forEach items="${requestScope.joblist }" var="job">
						<div class="it-post-box tn-border-dashed">
							<div class="it-post-name">
								<div class="tn-helper-right it-post-btn">
									<a class="it-font-underline" href="job.html" target=_blank><span class="tn-icon-view"></span><span class=tn-action-text>查看详细</span> </a>
									<a class="tn-button-small" href="javascript:applicate(${job.job_id});"><span class="tn-button-text">申请</span> </a>
								</div>
								<h3><a title=对日Java软件开发工程师 href="job.html" target=_blank>${job.job_name }</a></h3>
							</div>
							<ul class="it-post">
								<li style="width:300px;">薪资： <span class="it-font-size">${job.job_salary }</span></li>
								<li style="width:250px;"><span class=tn-text-note>工作地区：</span>
									<label for="">${job.job_area }</label>
								</li>
								<li><span class="tn-text-note">招聘人数：</span> ${job.job_hiringnum } </li>
								<li><span class="tn-text-note">申请人数：</span> 5 </li>
							</ul>
						</div>
					</c:forEach>
					<form name="applyform" action="apply" method="post">
						<input type="hidden" name="jobid" value="">
					</form>
					<script>
						function applicate(id){
							if(confirm("确定提交申请吗？")){
								$.ajax({url:"apply.apply",type:"POST",async:false,data:{"jobid":id},dataType:"json",
									success: function(data){
							        alert(data.msg);
							      }});
							}
						}
					</script>
					<!--职位列表-->
				</div>
			</div>
			<div class="bottomban">
				<div class="bottombanbox"> <img src="images/635560750235172731.jpg" /> </div>
			</div>
		</div>
		</div>
		</div>
		<!-- InstanceBeginEditable name="backtop" -->
		<p class="it-back-to-top" style=" position:fixed" id="backTop" title="返回顶部">
			<a href="#top"> <span> </span> 返回顶部 </a>
		</p>
		<!-- InstanceEndEditable -->
		<div width="100%" height="150">
			<%@ include file="../foot.jsp" %>
		</div>
		</div>
	</body>

</html>