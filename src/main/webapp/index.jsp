<%@page import="java.util.List,com.qst.itoffer.dao.CompanyDao,com.qst.itoffer.dao.JobDao,com.qst.itoffer.bean.CompanyBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
CompanyDao companyDao = new CompanyDao();
JobDao jobDao = new JobDao();
List<CompanyBean> list = companyDao.getAll();
for(int i = 0, len = list.size(); i < len; ++i){
	CompanyBean companyBean =(CompanyBean) list.get(i);
	companyBean.setJobList(jobDao.getTwo(companyBean.getCompany_id()));
}
request.setAttribute("companyList", list);
%>
<!DOCTYPE html>
<html>
	<head>
		<title>RTO服务_锐聘官网-大学生求职,大学生就业,IT行业招聘，IT企业快速入职 - 锐聘网</title>
		<meta name="renderer" content="ie-stand">
		<%@ include file="head.jsp" %>
		<link href="css/index.css" type="text/css" rel="stylesheet" />
	</head>
	<body class="tn-page-bg">
		<div width="100%" height="100">
			<jsp:include page="top.jsp" flush="true" />
		</div>
		<div id="tn-content">
			<div class="it-home-topbg">
				<div class="tn-box tn-widget tn-widget-content tn-corner-all it-home-top">
					<div class="tn-box-content tn-widget-content tn-corner-all">
						<div class="it-sliderkit">
							<script src="js/sliderkit_002.js" type="text/javascript"></script>
							<script src="js/jquery.js" type="text/javascript"></script>
							<script src="js/sliderkit.js" type="text/javascript"></script>
							<div style="display: block;" class="sliderkit photoslider-1click">
								<div class="sliderkit-btn sliderkit-go-btn sliderkit-go-prev" id="previousSlide" style="display: block;">
									<a rel="nofollow" href="javascript:;"><span>Previous</span></a>
								</div>
								<div class="sliderkit-btn sliderkit-go-btn sliderkit-go-next" id="nextSlide" style="display: block;">
									<a rel="nofollow" href="javascript:;"><span>Next</span></a>
								</div>
								<div style="" class="sliderkit-nav">
									<div style="" class="sliderkit-nav-clip" id="slideNumPanel">
										<ul style="width: 50px;">
											<li class="" style="width: 0px; height: 0px;">
												<a href="javascript:;" title="1">1</a>
											</li>
											<li class="" style="width: 0px; height: 0px;">
												<a href="javascript:;" title="2">1</a>
											</li>
											<li class="" style="width: 0px; height: 0px;">
												<a href="javascript:;" title="3">1</a>
											</li>
											<li class="sliderkit-selected" style="width: 0px; height: 0px;">
												<a href="javascript:;" title="4">1</a>
											</li>
											<li class="" style="width: 0px; height: 0px;">
												<a href="javascript:;" title="5">1</a>
											</li>
										</ul>
									</div>
								</div>
								<div class="sliderkit-panels">
									<div style="display: block;" class="sliderkit-panel">
										<a href="Index.htm" target="_blank"> <img src="images/635086152036177812.jpg" alt="1"> </a>
									</div>
									<div style="display: block;" class="sliderkit-panel">
										<a href="Index.htm" target="_blank"> <img src="images/635089669584615000.jpg" alt="2"> </a>
									</div>
									<div style="display: block;" class="sliderkit-panel sliderkit-panel-old">
										<a href="Index.htm" target="_blank"> <img src="images/635084673057125000.jpg" alt="3"> </a>
									</div>
									<div style="display: block;" class="sliderkit-panel sliderkit-panel-active">
										<a href="Index.htm" target="_blank"> <img src="images/635085509625826250.jpg" alt="4"> </a>
									</div>
									<div style="display: block;" class="sliderkit-panel">
										<a href="#" target="_blank"> <img src="images/635084672065718750.jpg" alt="5"> </a>
									</div>
								</div>
							</div>
							<script type="text/javascript">
								$(window).load(function() {

									$(".photoslider-1click").sliderkit({
										auto: 1,
										autostill: false,
										timer: true,
										keyboard: true,
										shownavitems: 5,
										circular: true
									});

									$("#slideNumPanel").attr("style", "");
									//fanyc修改鼠标移上去再显示左右按钮
									$(".photoslider-1click").mouseover(function(e) {
										$("#previousSlide").show();
										$("#nextSlide").show();
									}).mouseout(function() {
										$("#previousSlide").hide();
										$("#nextSlide").hide();
									});
								});
							</script>
						</div>
					</div>
				</div>
			</div>
			<!-- 循环遍历公司列表 -->
			<c:forEach items="${companyList }" var="item">
				<div class="tn-grid">
					<div class="tn-box tn-widget tn-widget-content tn-corner-all it-home-box">
						<div class="tn-box-content tn-widget-content tn-corner-all">
							<div class="it-company-keyimg tn-border-bottom tn-border-gray">
								<a href="recruit/company.html?${item.company_id }" target="_blank"> <img src="dfile?${item.company_pic }" width="990"> </a>
							</div>
							<c:if test="${not empty item.jobList }">
								<div class="it-home-present">
									<div class="it-present-btn">
										<a class=" tn-button tn-button-home-apply" href="recruit/company.html?${item.company_id }#morejob" target="_blank"> <span class="tn-button-text">我要申请</span> </a>
									</div>
									<c:forEach items="${item.jobList }" varStatus="i" var="job">
										<c:if test="${i.count == 1 }"><div class="it-present-text" style="padding-left:185px;"></c:if>
										<c:if test="${i.count == 2 }"><div class="it-present-text"></c:if>
											<div class="it-line01 it-text-bom">
												<p class="it-text-tit">职位</p>
												<p class="it-line01 it-text-explain">
													<span class="tn-icon it-home-arrow"></span>
													<c:if test="${i.count == 2 }">
														<span class="tn-helper-right tn-action">
															<a href="job.html" target="_blank" class="tn-button tn-corner-all tn-button-text-only tn-button-semidlong">
																<span class="tn-button-text">更多职位</span>
															</a>
														</span>
													</c:if>
													<a href="job.html" target="_blank" title=".NET软件开发工程师">${job.job_name }</a>
												</p>
			
											</div>
											<div class="it-line01 it-text-top">
												<p class="it-text-tit">薪资</p>
												<p class="it-line01 it-text-explain"> <span class="tn-icon it-home-arrow"></span> <b title="${job.job_salary }">${job.job_salary }</b> </p>
											</div>
										</div>
									</c:forEach>
								</div>
							</c:if>
						</div>
					</div>
				</div>
			</c:forEach>
			<div class="tn-box tn-widget tn-widget-content tn-corner-all it-home-recruiters">
				<div class="tn-box-content tn-widget-content tn-corner-all">
					<div class="tn-main-heading">
						<h2><span class="it-logos-title"></span></h2>
					</div>
					<div class="it-comlogo-list">
						<ul class="tn-photo-list tn-widget tn-helper-clearfix it-comlogo-ul it-comlogo-ul">
							<li class="tn-photo-item">
								<p class="tn-photo-wrap tn-widget-content tn-border-gray">
									<a href="http://www.itoffer.cn/Company/128" title="上海博辕"> <img alt="上海博辕" src="images/635090638930865000.jpg" width="120"><span></span></a>
								</p>
							</li>
							<li class="tn-photo-item">
								<p class="tn-photo-wrap tn-widget-content tn-border-gray">
									<a href="Index.htm" title="博彦科技"> <img alt="博彦科技" src="images/634954112522421875.jpg" width="120"><span></span></a>
								</p>
							</li>
							<li class="tn-photo-item">
								<p class="tn-photo-wrap tn-widget-content tn-border-gray">
									<a href="Index.htm" title="东南融通"> <img alt="东南融通" src="images/634954112688671875.jpg" width="120"><span></span></a>
								</p>
							</li>
							<li class="tn-photo-item">
								<p class="tn-photo-wrap tn-widget-content tn-border-gray">
									<a href="Index.htm" title="华为"> <img alt="华为" src="images/634954113455078125.jpg" width="120"><span></span></a>
								</p>
							</li>
							<li class="tn-photo-item">
								<p class="tn-photo-wrap tn-widget-content tn-border-gray">
									<a href="Index.htm" title="东软"> <img alt="东软" src="images/634954112813828125.jpg" width="120"><span></span></a>
								</p>
							</li>
							<li class="tn-photo-item">
								<p class="tn-photo-wrap tn-widget-content tn-border-gray">
									<a href="Index.htm" title="南天信息"> <img alt="南天信息" src="images/634954113001796875.jpg" width="120"><span></span></a>
								</p>
							</li>
							<li class="tn-photo-item">
								<p class="tn-photo-wrap tn-widget-content tn-border-gray">
									<a href="Index.htm" title="群硕"> <img alt="群硕" src="images/634954113155078125.jpg" width="120"><span></span></a>
								</p>
							</li>
							<li class="tn-photo-item">
								<p class="tn-photo-wrap tn-widget-content tn-border-gray">
									<a href="Index.htm" title="日立"> <img alt="日立" src="images/634954113301796875.jpg" width="120"><span></span></a>
								</p>
							</li>
							<li class="tn-photo-item">
								<p class="tn-photo-wrap tn-widget-content tn-border-gray">
									<a href="Index.htm" title="人人网"> <img alt="人人网" src="images/634954206219375000.jpg" width="120"><span></span></a>
								</p>
							</li>
							<li class="tn-photo-item">
								<p class="tn-photo-wrap tn-widget-content tn-border-gray">
									<a href="Index.htm" title="简柏特"> <img alt="简柏特" src="images/634954217492226562.jpg" width="120"><span></span></a>
								</p>
							</li>
							<li class="tn-photo-item">
								<p class="tn-photo-wrap tn-widget-content tn-border-gray">
									<a href="Index.htm" title="联发科"> <img alt="联发科" src="images/634954210151210937.jpg" width="120"><span></span></a>
								</p>
							</li>
							<li class="tn-photo-item">
								<p class="tn-photo-wrap tn-widget-content tn-border-gray">
									<a href="Index.htm" title="创迹"> <img alt="创迹" src="images/634954212053007812.jpg" width="120"><span></span></a>
								</p>
							</li>
							<li class="tn-photo-item">
								<p class="tn-photo-wrap tn-widget-content tn-border-gray">
									<a href="Index.htm" title="nec"> <img alt="nec" src="images/634954214356601562.jpg" width="120"><span></span></a>
								</p>
							</li>
							<li class="tn-photo-item">
								<p class="tn-photo-wrap tn-widget-content tn-border-gray">
									<a href="Index.htm" title="NTTDATA"> <img alt="NTTDATA" src="images/634954215820976562.jpg" width="120"><span></span></a>
								</p>
							</li>
						</ul>
					</div>
				</div>
			</div>

		</div>
		<div width="100%" height="150">
			<%@ include file="foot.jsp" %>
		</div>

	</body>

</html>