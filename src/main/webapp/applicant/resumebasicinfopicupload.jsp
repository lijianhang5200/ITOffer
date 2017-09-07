<%@page import="com.qst.itoffer.bean.ResumeBasicinfoBean,com.qst.itoffer.bean.ApplicantBean,com.qst.itoffer.dao.ResumeBasicinfoDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
ApplicantBean appBean = (ApplicantBean) session.getAttribute("user");
if (appBean != null) {
	ResumeBasicinfoDao resumeBasicinfoDao = new ResumeBasicinfoDao();
	ResumeBasicinfoBean resumeBasicinfoBean = resumeBasicinfoDao.get(appBean.getApplicant_id());
	request.setAttribute("ResumeBasicinfoBean", resumeBasicinfoBean);
}
%>
<!doctype html>
<html>

	<head>
		<title>我的简历 - 锐聘网</title>
		<%@ include file="../head.jsp" %>
		<link href="css/my_resume.css" type="text/css" rel="stylesheet" />
		<script type="text/javascript">
			function validate() {
				var filename = $("input[name='filename']").val();
				if(filename.value == "") {
					alert("请选择要上传的头像！");
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
						<form action="resume" method="post" onsubmit="return validate();">
							<input type="hidden" hidden="hidden" name="type" value="pic">
							<input type="hidden" hidden="hidden" name="applicant_id" value="${requestScope.ResumeBasicinfoBean.applicant_id }">
							<div class="table_style" style="margin-left: 150px;">
								<div class="uploade">
									<div align="center">
										<c:if test='${empty requestScope.ResumeBasicinfoBean.head_shot }'><img id="headpic" src="images/885220059400.jpg" width="150" height="150"></c:if>
										<c:if test='${not empty requestScope.ResumeBasicinfoBean.head_shot }'><img id="headpic" src='dfile?${requestScope.ResumeBasicinfoBean.head_shot }' width="150" height="150"></c:if>
										<input hidden="hidden" name="filename" type="text" value="">
										<p>&nbsp;</p>
										<input class="ufile" type="file" value="上传照片">
									</div>
								</div>
								<div class="clear"></div>
								<div class="he"></div>
								<div align="center">
									<input type="submit" class="save1" value="保存">
									<input type="reset" class="cancel2" value="取消">
								</div>
							</div>
						</form>
						<script>
						    czyx.uploadReplace('.ufile',{
						        url:'<%=basePath%>ufile', //文件处理的URL
						        uploadReplaceCss:{
						            //设置上传按钮图片
						            background:'url(images/uploadImg.jpg) center no-repeat',
						            width:110,             //上传按钮的宽度
						            height:30              //上传按钮的高度
						        },
						        uploadBefore:function(){
						            if(!/\.((jpg)|(gif)|(png))$/i.test(this.value)){
						                alert('只允许上传.jpg .gif .png类型的图片文件');
						                return false ;
						            }
						            this.style.display = 'none';
						        },
						        uploadEnd:function(data){//上传完毕后调用
						            this.style.display = 'block';
						           try{
						                data = $.parseJSON(data);  
						            }catch(e){
						                alert('上传失败');
						                return ;
						            }
						            console.log(data[0].filename);
						            $("img#headpic").attr("src","<%=basePath%>dfile?" +data[0].filename);
						            $("input[name='filename']").val(data[0].filename);
						        }
						    });
						    </script>
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