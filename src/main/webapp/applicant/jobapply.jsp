<%@page import="com.qst.itoffer.dao.CompanyDao"%>
<%@page import="com.qst.itoffer.bean.ApplicantBean,com.qst.itoffer.dao.JobApplyDao,java.util.List,com.qst.itoffer.bean.JobApplyBean,com.qst.itoffer.dao.JobDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
JobApplyDao jobApplyDao = new JobApplyDao();
ApplicantBean appBean = (ApplicantBean) session.getAttribute("SESSION_LOGIN_USER");
List<JobApplyBean> list = jobApplyDao.getPageList(appBean.getApplicant_id());
JobDao jobDao = new JobDao();
CompanyDao companyDao = new CompanyDao();
for(int i=0, len = list.size(); i<len;++i){
	JobApplyBean bean = list.get(i);
	bean.setJobBean(jobDao.getById(bean.getJob_id()));
	bean.setCompanyBean(companyDao.getById(bean.getJobBean().getCompany_id()));
}
request.setAttribute("jobapplylist", list);
%>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
		<title>我的工作申请 - 锐聘网</title>
		<%@ include file="../head.jsp" %>
		<link href="css/myapplys.css" rel="stylesheet" type="text/css" />
	</head>
	<body>
		<div width="100%" height="100">
			<jsp:include page="../top.jsp" flush="true" />
		</div>
		<div id="tn-content" class="tn-content-bg">
			<div class="tn-wrapper">
				<div class="tn-grid">
					<div class="it-content-box it-person">
						<div class="tn-box-content">
							<div class="tn-tabs">
								<ul class="tn-tabs-nav tn-widget-content ">
									<li>
										<a href="applicant/resume.html">我的简历</a>
									</li>
									<li class="tn-tabs-selected">
										<a href="applicant/jobApply.html">我的申请</a>
									</li>
									<li>
										<a href="applicant/changepassword.html">账号设置</a>
									</li>
								</ul>
								<div class="tn-tabs-panel tn-widget-content">
										<table class="tn-table-grid">
											<tbody>
												<tr class="tn-table-grid-header">
													<th class="tn-width-check"> <input type="checkbox" class="tn-checkbox" id="selectAll" name="selectall">
													</th>
													<th> 企业名称 </th>
													<th class="it-text-ctnter"> 职位名称 </th>
													<th class="it-text-ctnter"> 申请状态 </th>
													<th> </th>
												</tr>
												<!-- 循环 -->
												<c:forEach items="${requestScope.jobapplylist }" var="item">
													<tr class="tn-table-grid-row">
														<td class="tn-width-check"><input type="checkbox" class="tn-checkbox tnui-apply" value="494" name="applyIdList"></td>
														<td class="tn-width-auto">
															<a title=易科德软件有限公司 href="#" target="_blank"> ${item.companyBean.company_name }</a>
														</td>
														<th class="tn-width-pic-mini">
															<a href="#" target="_blank"> ${item.jobBean.job_name }</a>
														</th>
														<td class="tn-width-category">
															<div class="tn-instructions">
																<div class="it-instructions-tit"> <span style="width: 26px">申请</span><span style="width: 132px">审核</span><span style="width: 132px">通知</span></div>
																<div class="tn-progress-bar tn-widget-content tn-corner-all">
																	<c:if test="${item.apply_state==0 }"><div style="width: 50%;" class="tn-progress-bar-value tn-widget-header tn-corner-left tn-border-tbl"/></c:if>
																	<c:if test="${item.apply_state==1 }"><div style="width: 100%;" class="tn-progress-bar-value tn-widget-header tn-corner-left tn-border-tbl"/></c:if>
																	<c:if test="${item.apply_state==2 }"><div style="width: 0%;" class="tn-progress-bar-value tn-widget-header tn-corner-left tn-border-tbl"/></c:if>
																	
																</div>
																<ul class="tn-helper-clearfix tn-step-scale"></ul>
															</div>
														</td>
														<td class="tn-width-action2">
															<span class="tn-action">
																<a class="tn-action tn-action-text-icon tnui-apply-delete" href="javascript:del(${item.job_id});">
																	<span class="tn-icon it-icon-delete">
																	</span><span class="tn-action-text">删除</span>
																</a>
															</span>
														</td>
													</tr>
												</c:forEach>
												<!-- 循环 -->
												<script>
													function del(id){
														if(confirm("确定删除申请吗？")){
															$.ajax({url:"del.apply",type:"POST",async:false,data:{"jobid":id},dataType:"json",
																success: function(data){
														        alert(data.msg);
														        window.location.reload();
														      }});
														}
													}
												</script>
											</tbody>
										</table>
									<div class="it-page-results tn-helper-clearfix">
										<div class="tn-helper-left">
											<a class="tn-button tn-corner-all tn-button-text-only tn-button-semidlong" href="#" id="deleteAll"> <span class="tn-button-text">删除</span></a>
										</div>
										<div class="tn-pagination tn-pagination-simple tn-helper-clearfix">
											<div class="tn-pagination-btn"> <span class="tn-page-prev tn-page-thumb">上一页</span> <span class="tn-page-number tn-selected">1</span>
												<a href="#" class="tn-page-number">2</a>
												<a href="#" class="tn-page-thumb tn-page-next">下一页</a>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		</div>
		<div width="100%" height="150">
			<%@ include file="../foot.jsp" %>
		</div>
	</body>

</html>