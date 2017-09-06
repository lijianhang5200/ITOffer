<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

	<head>
		<title>注册 - 锐聘网</title>
		<%@ include file="head.jsp" %>
		<link href="css/register.css" type="text/css" rel="stylesheet" />
		<script>
			$(function() {
				getVcode();
			})

			function getVcode() {
				$("img#vcode").attr("src", "VcodeServlet?random=" + Math.random());
			}
		</script>
	</head>

	<body>
		<div width="100%" height="100">
			<jsp:include page="top.jsp" flush="true" />
		</div>
		<form action="register.do" method="post">
			<div class="content">
				<div class="page_name">注册</div>
				<div class="login_content">
					<div class="login_l">
						<div class="span1">
							<label class="tn-form-label">邮箱：</label>
							<input class="tn-textbox" name="email" type="text">
						</div>
						<div class="span1">
							<label class="tn-form-label">密码：</label>
							<input class="tn-textbox" name="password" type="password">
						</div>
						<div class="span1">
							<label class="tn-form-label">验证码：</label>
							<input class="tn-textbox-long" name="vcode" type="text">
							<span> <img id="vcode" src="" title="点击换一换" width="100" height="32" class="passcode" style="height:43px;cursor:pointer;" onclick="javascript:getVcode();"/>
									<a href="javascript:getVcode();" >看不清？</a> </span> </div>
						<div class="tn-form-row-button">
							<div class="span1">
								<input type="submit" class="tn-button-text" value="立即注册">
								<p class="it-register-text">
									<input name="" id="" class="tn-checkbox" value="true" checked="checked" type="checkbox">
									<label> 同意本站服务条款</label>
									<a href="javascript:;">查看</a>
								</p>
							</div>
						</div>
						<div class="clear"></div>
					</div>
					<div class="register_r">
						<p align="center"> <b>还没有帐号？</b>
							<a href="register.html">10秒钟快速注册</a>
						</p>

						<div><img src="images/reg_pic.jpg"></div>

						<div class="clear"></div>
					</div>
					<div class="clear"></div>
				</div>
			</div>
		</form>
		<div width="100%" height="150">
			<%@ include file="foot.jsp" %>
		</div>
	</body>

</html>