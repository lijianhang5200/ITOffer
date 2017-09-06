<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html>

	<head>
		<title>我的简历 - 锐聘网</title>
		<%@ include file="../head.jsp" %>
		<link href="css/my_resume.css" type="text/css" rel="stylesheet" />
		<script type="text/javascript">
			function validate() {
				var headShot = document.getElementById("headShot");
				if(headShot.value == "") {
					alert("请选择要上传的头像！");
					headShot.focus();
					return false;
				}
				return true;
			}
		</script>
	</head>

	<body>
		<div width="100%" height="100">
			<jsp:include page="../top.jsp" flush="true" />
		</div>

		<!-- 简历照片上传页面 开始 -->
		<div class="resume_con">
			<!--tab设置-->
			<div class="user_operate">
				<ul style="float: left">
					<li>
						<a href="applicant/resume.html">我的简历</a>
					</li>
					<li class="tn-tabs-selected">
						<a href="applicant/jobApply.html">我的申请</a>
					</li>
				</ul>
				<div class="clear"></div>
			</div>
			<!--主体部分-->
			<div class="resume_main">
				<!--左边-->
				<div class="resume_left">
					<div class="resume_title">
						<div style="float: left">简历照片</div>
					</div>
					<div class="all_resume">
						<!--------------------- 简历照片修改------------------------->
						<form action="" method="post" enctype="multipart/form-data" onsubmit="return validate();">
							<div class="table_style" style="margin-left: 150px;">
								<div class="uploade">
									<div align="center">
										<img src="applicant/images/anonymous.png" width="150" height="150">
										<p>&nbsp;</p>
										<input name="headShot" id="headShot" type="file" value="上传照片">
									</div>
								</div>
								<div class="clear"></div>
								<div class="he"></div>
								<div align="center">
									<input name="submit" type="submit" class="save1" value="保存">
									<input name="reset" type="reset" class="cancel2" value="取消">
								</div>
							</div>
						</form>
						<!--------------------- 简历照片修改 结束---------------------->
					</div>
				</div>
				<!--右边-->
				<div width="100%" height="100">
					<jsp:include page="resume_right.jsp" flush="true" />
				</div>
				<div style="clear:both"></div>
			</div>
		</div>
		<!-- 我的简历页面结束 -->
		<!-- 网站公共尾部 -->
		<div width="100%" height="150">
			<%@ include file="../foot.jsp" %>
		</div>
	</body>

</html>