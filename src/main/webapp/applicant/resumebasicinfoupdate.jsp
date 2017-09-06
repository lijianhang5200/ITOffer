<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
						<div class="table_style">
							<table width="300" border="0" cellpadding="3" cellspacing="1" bgcolor="#EEEEEE">
								<tr>
									<th width="110" align="right" bgcolor="#F8F8F8">姓名：</th>
									<td bgcolor="#F8F8F8"><input type="text" name="" value="冯娟娟"></td>
								</tr>
							</table>
							<div class="he"></div>
							<table width="300" border="0" cellpadding="3" cellspacing="1" bgcolor="#EEEEEE">
								<tr>
									<th width="110" align="right" bgcolor="#F8F8F8">性别：</th>
									<td bgcolor="#F8F8F8"><input type="radio" name="" value="">男<input type="radio" name="" value="">女</td>
								</tr>
							</table>
							<div class="he"></div>
							<table width="300" border="0" cellpadding="3" cellspacing="1" bgcolor="#EEEEEE">
								<tr>
									<th width="110" align="right" bgcolor="#F8F8F8">出生日期：</th>
									<td bgcolor="#F8F8F8"><input type="text" name="" value="2005-09-09"></td>
								</tr>
							</table>
							<div class="he"></div>
							<table width="300" border="0" cellpadding="3" cellspacing="1" bgcolor="#EEEEEE">
								<tr>
									<th width="110" align="right" bgcolor="#F8F8F8">手机：</th>
									<td bgcolor="#F8F8F8"><input type="text" name="" value="13333333333333"></td>
								</tr>
							</table>
							<div class="he"></div>
							<table width="300" border="0" cellpadding="3" cellspacing="1" bgcolor="#EEEEEE">
								<tr>
									<th width="110" align="right" bgcolor="#F8F8F8">邮件：</th>
									<td bgcolor="#F8F8F8"><input type="text" name="" value="test@test.com"></td>
								</tr>
							</table>
							<div class="he"></div>
							<table width="300" border="0" cellpadding="3" cellspacing="1" bgcolor="#EEEEEE">
								<tr>
									<th width="110" align="right" bgcolor="#F8F8F8">求职意向：</th>
									<td bgcolor="#F8F8F8"><input type="text" name="" value="软件开发"></td>
								</tr>
							</table>
							<div class="he"></div>
							<table width="300" border="0" cellpadding="3" cellspacing="1" bgcolor="#EEEEEE">
								<tr>
									<th width="110" align="right" bgcolor="#F8F8F8">工作经验：</th>
									<td bgcolor="#F8F8F8"><input type="text" name="" value="应届毕业生"></td>
								</tr>
							</table>
							<div class="he"></div>
							<div style="margin-left:100px;"><input name="" type="text" class="save1" value="保存">
								<input name="" type="text" class="cancel2" value="取消"></div>
						</div>
						<div style="float:right" class="uploade"><img src="images/person_img.jpg">
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