<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html>

	<head>
		<title>“锐聘之星”软件设计大赛 - 锐聘网</title>
		<%@ include file="../head.jsp" %>
		<link href="css/applysuccess.css" type="text/css" rel="stylesheet" />
	</head>

	<body>
		<div width="100%" height="100">
			<jsp:include page="../top.jsp" flush="true" />
		</div>
		<div class="applyit-content-box">
			<div class="it-success-tips">
				<div class="it-success-icon">
					<div class="it-pageimg"> </div>
				</div>
				<div class="it-success-word">
					<a href="#" title="恭喜您成功申请职位！">恭喜您成功申请职位！</a> <br> 锐聘网会在3-5天内跟您取得联系。
					<p> 企业：
						<a href="#"><b>无锡晟奥软件有限公司</b></a><br> 职位：
						<a href="#"><b>对日Cobol软件开发工程师</b></a>
					</p>
				</div>
				<div class="clear"></div>
			</div>
			<div class="it-more-actions">
				<p class="tn-text-note"> 接下来您可以：</p>
				<div class="it-comment-btn">
					<a href="index.html" class="app_btn"> <span class="tn-icon it-icon-arrow"></span><span class="tn-button-text">申请其他职位</span> </a>
				</div>
			</div>
			<div class="it-secondary-link">
				<ul>
					<li><span class="it-icon-view"></span>
						<a href="#" title="查看我的职位申请">查看我的职位申请</a>
					</li>
					<li><span class="it-icon-modify"></span>
						<a href="#" title="修改我的简历">修改我的简历</a>
					</li>
				</ul>
			</div>
		</div>
		<div width="100%" height="150">
			<%@ include file="../foot.jsp" %>
		</div>
	</body>

</html>