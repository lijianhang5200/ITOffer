<%@page import="com.qst.itoffer.dao.EduDao"%>
<%@page import="com.qst.itoffer.bean.ResumeBasicinfoBean,com.qst.itoffer.bean.ApplicantBean,com.qst.itoffer.dao.ResumeBasicinfoDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
ApplicantBean appBean = (ApplicantBean) session.getAttribute("SESSION_LOGIN_USER");
if (appBean != null) {
	ResumeBasicinfoDao resumeBasicinfoDao = new ResumeBasicinfoDao();
	request.setAttribute("ResumeBasicinfoBean", resumeBasicinfoDao.get(appBean.getApplicant_id()));
	EduDao eduDao = new EduDao();
	request.setAttribute("edulist", eduDao.getByApplicantId(appBean.getApplicant_id()));
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
						<div style="float:left">基本信息</div>
						<div class="btn">
							<a href="applicant/resumeBasicinfoUpdate.html">修改</a>
						</div>
					</div>
					<div class="all_resume">
						<div class="table_style">
							<table width="300" border="0" cellpadding="3" cellspacing="1" bgcolor="#EEEEEE">
								<tr>
									<th width="110" align="right" bgcolor="#F8F8F8">姓名：</th>
									<td bgcolor="#F8F8F8">${requestScope.ResumeBasicinfoBean.realname }</td>
								</tr>
							</table>
							<div class="he"></div>
							<table width="300" border="0" cellpadding="3" cellspacing="1" bgcolor="#EEEEEE">
								<tr>
									<th width="110" align="right" bgcolor="#F8F8F8">性别：</th>
									<td bgcolor="#F8F8F8">
										<c:if test='${requestScope.ResumeBasicinfoBean.gender == 0}'>女</c:if>
										<c:if test='${requestScope.ResumeBasicinfoBean.gender == 1}'>男</c:if>
									</td>
								</tr>
							</table>
							<div class="he"></div>
							<table width="300" border="0" cellpadding="3" cellspacing="1" bgcolor="#EEEEEE">
								<tr>
									<th width="110" align="right" bgcolor="#F8F8F8">出生日期：</th>
									<td bgcolor="#F8F8F8">${requestScope.ResumeBasicinfoBean.birthday }</td>
								</tr>
							</table>
							<div class="he"></div>
							<table width="300" border="0" cellpadding="3" cellspacing="1" bgcolor="#EEEEEE">
								<tr>
									<th width="110" align="right" bgcolor="#F8F8F8">手机：</th>
									<td bgcolor="#F8F8F8">${requestScope.ResumeBasicinfoBean.telephone }</td>
								</tr>
							</table>
							<div class="he"></div>
							<table width="300" border="0" cellpadding="3" cellspacing="1" bgcolor="#EEEEEE">
								<tr>
									<th width="110" align="right" bgcolor="#F8F8F8">邮件：</th>
									<td bgcolor="#F8F8F8">${requestScope.ResumeBasicinfoBean.email }</td>
								</tr>
							</table>
							<div class="he"></div>
							<table width="300" border="0" cellpadding="3" cellspacing="1" bgcolor="#EEEEEE">
								<tr>
									<th width="110" align="right" bgcolor="#F8F8F8">求职意向：</th>
									<td bgcolor="#F8F8F8">${requestScope.ResumeBasicinfoBean.job_intension }</td>
								</tr>
							</table>
							<div class="he"></div>
							<table width="300" border="0" cellpadding="3" cellspacing="1" bgcolor="#EEEEEE">
								<tr>
									<th width="110" align="right" bgcolor="#F8F8F8">工作经验：</th>
									<td bgcolor="#F8F8F8">${requestScope.ResumeBasicinfoBean.job_experience }</td>
								</tr>
							</table>
							<div class="he"></div>
						</div>
						<div style="float:right" class="uploade">
						<c:if test='${empty requestScope.ResumeBasicinfoBean.head_shot }'><img id="headpic" src="images/885220059400.jpg" width="150" height="150"></c:if>
						<c:if test='${not empty requestScope.ResumeBasicinfoBean.head_shot }'><img id="headpic" src='dfile?${requestScope.ResumeBasicinfoBean.head_shot }' width="150" height="150"></c:if>
							<div align="center">
								<a href="applicant/resumeBasicInfoPicUpload.html" class="uploade_btn">更换照片</a>
							</div>
						</div>
						<div class="clear"></div>
					</div>
					<div class="resume_title">
						<div style="float:left">教育经历</div>
						<div class="btn"><a href="applicant/resumeedu.jsp">添加</a></div>
					</div>
					<div class="it-table-grid">
						<form name="deledu" action="deledu.resume" method="post">
							<input type="hidden" name="eduid" value="">
						</form>
						<script type="text/javascript">
							function deledu(id){
								if(confirm("确定删除这条教育经历吗？")){
									$("input[name='eduid']").val(id);
									$("form[name='deledu']").submit();
								}
							}
						</script>
						<ul>
							<li class="tn-border-gray tn-border-bottom it-table-grid-header">
								<p class="tn-name">毕业院校</p>
								<p class="tn-date">就读时间</p>
								<p class="tn-degree">学历</p>
								<p class="tn-fieldofstudy">专业</p>
							</li>
							<c:forEach items="${requestScope.edulist }" var="item">
							<li class="tn-border-gray tn-border-bottom">
								<p class="tn-name" title="青软实训">${item.school }</p>
								<p class="tn-date">${item.time }</p>
								<p class="tn-degree">${item.education }&nbsp;</p>
								<p class="tn-fieldofstudy">${item.major }&nbsp;</p>
								<span class="tn-actions">
									<a href="applicant/resumeedu.html?${item.eduid }" class="tn-action tn-action-text-icon">
				            			<span class="tn-icon it-icon-modify"></span>
				            			<span class="tn-action-text">修改</span>
									</a>
									<a href="javascript:deledu(${item.eduid });"  class="tn-action tn-action-text-icon tn-delete">
										<span class="tn-icon it-icon-delete"></span>
										<span class="tn-action-text">删除</span>
									</a>
								</span>
							</li>
							</c:forEach>
						</ul>
					</div>

					<div class="resume_title">
						<div style="float:left">工作经历</div>
						<div class="btn">添加</div>
					</div>
					<div class="it-table-grid">
						<ul>
							<li class="tn-border-gray tn-border-bottom it-table-grid-header">
								<p class="tn-name">工作公司 </p>
								<p class="tn-date">在职时间</p>
								<p class="tn-degree">部门</p>
								<p class="tn-fieldofstudy">职位名称</p>
							</li>
							<li class="tn-border-gray tn-border-bottom">
								<p class="tn-name" title="青软实训">青软实训</p>
								<p class="tn-date">2013/10-2014/10</p>
								<p class="tn-degree">研发部</p>
								<p class="tn-fieldofstudy">软件开发工程师</p>
								<span class="tn-actions">
									<a href="#" class="tn-action tn-action-text-icon">
			            				<span class="tn-icon it-icon-modify"></span>
			            				<span class="tn-action-text">修改</span>
									</a>
									<a href="" class="tn-action tn-action-text-icon tn-delete">
										<span class="tn-icon it-icon-delete"></span>
										<span class="tn-action-text">删除</span>
									</a>
								</span>
							</li>

						</ul>
					</div>

					<div class="resume_title">
						<div style="float:left">项目经验</div>
						<div class="btn">添加</div>
					</div>
					<div class="it-table-grid">
						<ul>
							<li class="tn-border-gray tn-border-bottom it-table-grid-header">
								<p class="tn-name">项目名称 </p>
								<p class="tn-date">参与时间</p>
								<p class="tn-degree">担任职位</p>
							</li>
						</ul>
					</div>
					<div class="resume_title">
						<div style="float:left">培训经历</div>
						<div class="btn">添加</div>
					</div>
					<div class="it-table-grid">
						<ul>
							<li class="tn-border-gray tn-border-bottom it-table-grid-header">
								<p class="tn-name">培训名称 </p>
								<p class="tn-date">培训时间</p>
							</li>
						</ul>
					</div>
					<div class="resume_title">
						<div style="float:left">获得证书</div>
						<div class="btn">添加</div>
					</div>
					<div class="it-table-grid">
						<ul>
							<li class="tn-border-gray tn-border-bottom it-table-grid-header">
								<p class="tn-name"> 证书名称 </p>
							</li>
						</ul>
					</div>
					<div class="resume_title">
						<div style="float:left">语言能力</div>
						<div class="btn">添加</div>
					</div>

					<div class="it-table-grid">
						<ul>
							<li class="tn-border-gray tn-border-bottom it-table-grid-header">
								<p class="tn-name">语言 </p>
								<p class="tn-date">听说</p>
								<p class="tn-degree">读写</p>
								<p class="tn-fieldofstudy">等级考试</p>
							</li>
							<li class="tn-border-gray tn-border-bottom">
								<p class="tn-name" title="英语">英语</p>
								<p class="tn-date">熟练</p>
								<p class="tn-degree">熟练</p>
								<p class="tn-fieldofstudy">CET-6</p>
								<span class="tn-actions">
									<a href="#" class="tn-action tn-action-text-icon">
			            				<span class="tn-icon it-icon-modify"></span>
			            				<span class="tn-action-text">修改</span>
									</a>
									<a href="" class="tn-action tn-action-text-icon tn-delete">
										<span class="tn-icon it-icon-delete"></span>
										<span class="tn-action-text">删除</span>
									</a>
								</span>
							</li>

						</ul>
					</div>
					<div class="resume_title">
						<div style="float:left">IT技能</div>
						<div class="btn">添加</div>
					</div>
					<div class="it-table-grid">
						<ul>
							<li class="tn-border-gray tn-border-bottom it-table-grid-header">
								<p class="tn-auto">技能名称</p>
								<p class="tn-name">熟练程度</p>
							</li>
							<li class="tn-border-gray tn-border-bottom">
								<p class="tn-auto">Oracle</p>
								<p class="tn-name">熟练</p>
								<span class="tn-actions">
									<a href="#" class="tn-action tn-action-text-icon">
				            			<span class="tn-icon it-icon-modify"></span><span class="tn-action-text">修改</span>
									</a>
									<a href="" class="tn-action tn-action-text-icon tn-delete">
										<span class="tn-icon it-icon-delete"></span><span class="tn-action-text">删除</span>
									</a>
								</span>
							</li>
							<li class="tn-border-gray tn-border-bottom">
								<p class="tn-auto">JavaEE</p>
								<p class="tn-name">熟练</p>
								<span class="tn-actions">
									<a href="#" class="tn-action tn-action-text-icon">
				            			<span class="tn-icon it-icon-modify"></span><span class="tn-action-text">修改</span>
									</a>
									<a href="" class="tn-action tn-action-text-icon tn-delete">
										<span class="tn-icon it-icon-delete"></span><span class="tn-action-text">删除</span>
									</a>
								</span>
							</li>
							<li class="tn-border-gray tn-border-bottom">
								<p class="tn-auto">Java</p>
								<p class="tn-name">熟练</p>
								<span class="tn-actions">
									<a href="#" class="tn-action tn-action-text-icon">
				            			<span class="tn-icon it-icon-modify"></span><span class="tn-action-text">修改</span>
									</a>
									<a href="" class="tn-action tn-action-text-icon tn-delete">
										<span class="tn-icon it-icon-delete"></span><span class="tn-action-text">删除</span>
									</a>
								</span>
							</li>

						</ul>
					</div>
					<div class="resume_title">
						<div style="float:left">其他信息</div>
						<div class="btn">添加</div>
					</div>
					<div class="it-table-grid">
						<ul>
							<li class="tn-border-gray tn-border-bottom it-table-grid-header">
								<p class="tn-name">标题</p>
								<p class="tn-auto">描述</p>
							</li>
						</ul>
					</div>
					<div class="resume_title">
						<div style="float:left">简历附件</div>
						<div class="btn">添加</div>
					</div>
					<div class="it-table-grid">
						<div class="it-table-grid">暂无附件！</div>
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