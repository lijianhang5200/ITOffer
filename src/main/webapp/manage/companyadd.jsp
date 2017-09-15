<%@page import="com.qst.itoffer.dao.CompanyDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String id = request.getQueryString();
if(id != null){
	CompanyDao companyDao = new CompanyDao();
	request.setAttribute("company", companyDao.getById(Integer.parseInt(id)));
}
String basePath = "" + request.getScheme() + "://"+request.getServerName();
if(request.getServerPort()!=80){
	basePath += ":" + request.getServerPort();
}
basePath += request.getContextPath()+"/";
%>
<!doctype html>
<html>
	<head>
		<base href="<%=basePath%>">
		<meta charset="utf-8">
		<title>添加企业</title>
		<link href="css/manageadmin.css" rel="stylesheet" type="text/css" />
		<script src="js/jquery.js"></script>
		<script type="text/javascript" src="ckeditor/ckeditor.js"></script>
		<script src="js/uploadReplace.js"></script>
		<script type="text/javascript">
			function validate() {
				if(document.getElementById("companyName").value == "") {
					alert("企业名称不能为空！");
					document.getElementById("companyName").focus();
					return false;
				}
				if(document.getElementById("companyArea").value == "") {
					alert("企业所在地不能为空！");
					document.getElementById("companyArea").focus();
					return false;
				}
				if(document.getElementById("companySize").value == "") {
					alert("企业规模不能为空！");
					document.getElementById("companySize").focus();
					return false;
				}
				if(document.getElementById("companyType").value == "") {
					alert("企业性质不能为空！");
					document.getElementById("companyType").focus();
					return false;
				}
				if(document.getElementById("companyPic").value == "") {
					alert("请选择企业宣传图片！");
					document.getElementById("companyPic").focus();
					return false;
				}
				return true;
			}
		</script>
	</head>

	<body>
		<div class="place"> <span>位置：</span>
			<ul class="placeul">
				<li>
					<a href="#">首页</a>
				</li>
				<li>
					<a href="#">添加企业</a>
				</li>
			</ul>
		</div>
		<div class="formbody">
			<div class="usual">
				<form name="frm" action="companyList.html" method="post" enctype="multipart/form-data" onsubmit="return validate();">
					<input name="companyid" type="hidden" value="${requestScope.company.company_id }">
					<div class="tabson">
						<ul class="forminfo">
							<li>
								<label>企业名称<b>*</b></label>
								<input name="companyName" type="text" id="companyName" class="dfinput" style="width:518px;" value="${requestScope.company.company_name }"/>
							</li>
							<li>
								<label>企业所在地<b>*</b></label>
								<input name="companyArea" type="text" id="companyArea" class="dfinput" style="width:518px;" value="${requestScope.company.company_area }"/>
							</li>
							<li>
								<label>企业规模<b>*</b></label>
								<input name="companySize" type="text" id="companySize" class="dfinput" style="width:518px;" value="${requestScope.company.company_size }"/>
							</li>
							<li>
								<label>企业性质<b>*</b></label>
								<select name="companyState" class="select3">
									<c:if test="${requestScope.company.company_type == 1 }"><option value="1" selected>股份制企业</option></c:if>
									<c:if test="${requestScope.company.company_type != 1 }"><option value="1">股份制企业</option></c:if>
									<c:if test="${requestScope.company.company_type == 2 }"><option value="2" selected>外资企业</option></c:if>
									<c:if test="${requestScope.company.company_type != 2 }"><option value="2">外资企业</option></c:if>
									<c:if test="${requestScope.company.company_type == 3 }"><option value="3" selected>合资企业</option></c:if>
									<c:if test="${requestScope.company.company_type != 3 }"><option value="3">合资企业</option></c:if>
								</select>
							</li>
							<li>
								<p>企业简介&nbsp;(不超过1000字)</p>
								<textarea class="ckeditor" cols="50" id="companyBrief" name="companyBrief" rows="10">${requestScope.company.company_brief }</textarea>
							</li>
							<li>
								<label>企业招聘状态</label>
								<div class="vocation">
									<select name="companyState" class="select3">
										<c:if test="${requestScope.company.company_state == 1 }"><option value="1" selected>招聘中</option></c:if>
										<c:if test="${requestScope.company.company_state != 1 }"><option value="1">招聘中</option></c:if>
										<c:if test="${requestScope.company.company_state == 2 }"><option value="2" selected>已暂停</option></c:if>
										<c:if test="${requestScope.company.company_state != 2 }"><option value="2">已暂停</option></c:if>
										<c:if test="${requestScope.company.company_state == 3 }"><option value="3" selected>已结束</option></c:if>
										<c:if test="${requestScope.company.company_state != 3 }"><option value="3">已结束</option></c:if>
									</select>
								</div>
							</li>
							<li>
								<label>显示排序<b></b></label>
								<input name="companySort" type="text" class="dfinput" style="width:100px;" value="${requestScope.company.company_sort }"/>
							</li>
							<li>
								<label>宣传图片<b>*</b></label>
								<img id="headpic" src="dfile?${requestScope.company.company_pic }" width="150" height="150">
								<input hidden="hidden" name="companyPic" type="text" value="${requestScope.company.company_pic }" alt="图片飞走了">
								<input type="file" class="ufile"/>
							</li>
							<li> <label>&nbsp;</label>
								<input name="" type="submit" class="btn" value="确定" />
							</li>
						</ul>
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
			</div>
		</div>
	</body>

</html>