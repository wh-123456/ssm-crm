<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>教师信息管理</title>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/bootstrap3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/bootstrap3.3.7/css/bootstrap-theme.min.css">
<script type="text/javascript"
	src="${pageContext.request.contextPath}/css/bootstrap3.3.7/js/jquery-2.1.4.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/css/bootstrap3.3.7/js/bootstrap.min.js"></script>
</head>
<style>
h1 {
	text-align: center;
}
</style>
<body>
<!-- 显示查询到的权限-->
	<!-- 导航条 前进后退关闭 -->
	<div class="header">
		<div class="navbar navbar-default">
			<ul class="nav navbar-nav">
				<!-- <li class="active">
					<button class="btn btn-link" onclick="window.close()">关闭</button>
				</li> -->
				<li>
					<button class="btn btn-link" onclick="history.back()">后退</button>
				</li>
			</ul>
		</div>
	</div>
	<!--主页面设计  -->
	<div class="container">
		<h1>用户权限列表</h1>
		<table border="2px" 
			class="table table-striped table-bordered table-hover">
			<tr>
				<th id="id">编号(计数)</th>
				<th>权限ID</th>
				<th>权限名称</th>
				<th>民族</th>
				<th>邮编</th>
				<th>电话</th>
				<th>备注</th>
				<th>操作</th>
			</tr>
				<c:forEach var="t" items="${tea}" varStatus="vs">
				<tr>
					<td>${vs.count}</td>
					<td>${t.name}</td>
					<td>${t.address}</td>
					<td>${t.nation}</td>
					<td>${t.postcode}</td>
					<td>${t.phone}</td>
					<td>${t.remark}</td>
					<td><a href="<%=request.getContextPath()%>/teacher/goupdate?id=${t.dataId}"class="btn btn-primary">修改</a>
					&nbsp;&nbsp;
					<a href="<%=request.getContextPath()%>/teacher/delete?id=${t.dataId}" class="btn btn-danger" onclick="return del(1,1,1)">删除</a>
				   </td>
				</tr>
				</c:forEach>
		</table>
<!-- 分页栏 -->
		<div class="row" style="margin-left: 35%">
			<p style="margin-left: 10%">共${page.pages}页,当前是第${page.pageNum}页</p>
			<a href="<%=request.getContextPath()%>/teacher/selectTeaAll?page=${page.firstPage}">第一页</a>
			<a href="<%=request.getContextPath()%>/teacher/selectTeaAll?page=${page.nextPage}">下一页</a>
			<a href="<%=request.getContextPath()%>/teacher/selectTeaAll?page=${page.prePage}">上一页</a>
			<a href="<%=request.getContextPath()%>/teacher/selectTeaAll?page=${page.lastPage}">最后一页</a>
	     </div>
</body>
<script type="text/javascript">
	//单个删除
	function del(id, mid, iscid) {
		if (confirm("您确定要删除吗?")){
	
		}
	}
</script>
</html>