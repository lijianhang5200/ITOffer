<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html>
	<head>
		<jsp:include page="basepath.jsp" flush="true" />
		<meta charset="utf-8">
		<title>职位列表</title>
		<link href="css/manageadmin.css" rel="stylesheet" type="text/css" />
	</head>
	<body>
		<div class="place"> <span>位置：</span>
			<ul class="placeul">
				<li>
					<a href="index.html">首页</a>
				</li>
				<li>职位列表</li>
			</ul>
		</div>
		<div class="rightinfo">
			<div class="tools">
				<ul class="toolbar">
					<li class="click"><span><img src="images/t01.png" /></span>
						<a href="manage/jobAdd.html">添加</a>
					</li>
				</ul>
				<div style="width:630px;height:42px;">
					<ul class="seachform">
						<li>
							<div class="vocation">
								所属企业：
								<select class="select3" name="companyId">
									<option value="0">全部企业</option>
									<option value="1">青软实训</option>
									<option value="2">江苏锐聘</option>
								</select>
							</div>
						</li>
						<li>
							职位名称：<input type="text" class="scinput" name="jobName" />
						</li>
						<li>
							<input name="" type="button" class="scbtn" value="查询" />
						</li>
					</ul>
				</div>
			</div>
			<table class="imgtable">
				<thead>
					<tr>
						<th>职位名称</th>
						<th>所属企业</th>
						<th>招聘数</th>
						<th>申请数</th>
						<th>结束日期</th>
						<th>招聘状态</th>
						<th>操作</th>
					</tr>
				</thead>
				<tbody>
					<tr height="50px">
						<td>Java软件开发</td>
						<td>青软实训</td>
						<td>10</td>
						<td>40</td>
						<td>2015-12-8</td>
						<td>招聘中</td>
						<td>
							<a href="#" class="tablelink">修改</a> &nbsp;&nbsp;
							<a href="#" class="tablelink"> 删除</a>
						</td>
					</tr>
					<tr height="50px">
						<td>Java软件开发</td>
						<td>青软实训</td>
						<td>10</td>
						<td>40</td>
						<td>2015-12-8</td>
						<td>招聘中</td>
						<td>
							<a href="#" class="tablelink">修改</a> &nbsp;&nbsp;
							<a href="#" class="tablelink"> 删除</a>
						</td>
					</tr>
					<tr height="50px">
						<td>Java软件开发</td>
						<td>青软实训</td>
						<td>10</td>
						<td>40</td>
						<td>2015-12-8</td>
						<td>招聘中</td>
						<td>
							<a href="#" class="tablelink">修改</a> &nbsp;&nbsp;
							<a href="#" class="tablelink"> 删除</a>
						</td>
					</tr>
				</tbody>
			</table>
			<div class="pagin">
				<div class="message">共<i class="blue">1256</i>页，当前显示第&nbsp;<i class="blue">2&nbsp;</i>页</div>
				<ul class="paginList">
					<li class="paginItem">
						<a href="javascript:;">首页</a>
					</li>
					<li class="paginItem">
						<a href="javascript:;">上一页<span class="pagepre"></span></a>
					</li>
					<li class="paginItem">
						<a href="javascript:;">下一页<span class="pagenxt"></span></a>
					</li>
					<li class="paginItem">
						<a href="javascript:;">尾页</a>
					</li>
				</ul>
			</div>
		</div>
	</body>

</html>