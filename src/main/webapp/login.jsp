<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html>

	<head>
		<title>登录 - 锐聘网</title>
		<%@ include file="head.jsp" %>
		<link href="css/login.css" type="text/css" rel="stylesheet" />
	</head>
	<body>
		<div width="100%" height="100">
			<jsp:include page="top.jsp" flush="true" />
		</div>
		<form action="login.do" method="post">
			<div class="content">
				<div class="page_name">登陆</div>
				<div class="login_content">
					<div class="login_l">
						<p class="font14">使用注册邮箱登录</p>
						<div class="span1">
							<label class="tn-form-label">邮箱：</label>
							<input name="email" class="tn-textbox" type="text" value="lijianhang">
						</div>
						<div class="span1">
							<label class="tn-form-label">密码：</label>
							<input name="password" class="tn-textbox" type="password" value="123456">
						</div>
						<div class="tn-form-row-button">
							<div class="span1">
								<input type="submit" class="tn-button-text" value="登   录">
								<span class="it-register-text">
						          <input checked="checked" class="tn-checkbox" value="true" type="checkbox">
						          <label for="RememberPassword"> 记住密码</label>
						        </span> </div>
						</div>
						<div class="clear"></div>
					</div>
					<div class="login_r">
						<p align="center"> <b>还没有帐号？</b>
							<a href="register.html">10秒钟快速注册</a>
						</p>

						<div><img src="images/login_pic.jpg"></div>

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