<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="zh-cn">
<head>
<base href="<%=basePath%>" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
<meta name="renderer" content="webkit">
<title></title>
<link rel="stylesheet" href="<%=basePath%>static/css/pintuer.css">
<link rel="stylesheet" href="<%=basePath%>static/css/admin.css">
<link rel="stylesheet" href="<%=basePath%>static/css/bootstrap.min.css">
<script src="<%=basePath%>static/js/jquery.js"></script>
<script src="<%=basePath%>static/js/bootstrap.js"></script>
<script src="<%=basePath%>static/js/pintuer.js"></script>
<script src="<%=basePath%>static/js/userList.js"></script>
</head>
<body>
	<form method="post" action="" id="listform">
		<div class="panel admin-panel">
			<div class="panel-head">
				<strong class="icon-reorder"> 内容列表</strong> <a href=""
					style="float: right; display: none;">添加字段</a>
			</div>
			<div class="padding border-bottom">
				<ul class="search" style="padding-left: 10px;">
					<li><button type="button" name="add"
							class="button border-main icon-plus-square-o" data-toggle="modal"
							data-target="#addUser">添加用户</button></li>
					<li>搜索：</li>
					<li>首页 <select name="s_ishome" class="input"
						onchange="changesearch()"
						style="width: 60px; line-height: 17px; display: inline-block">
							<option value="">选择</option>
							<option value="1">是</option>
							<option value="0">否</option>
					</select> &nbsp;&nbsp; 推荐 <select name="s_isvouch" class="input"
						onchange="changesearch()"
						style="width: 60px; line-height: 17px; display: inline-block">
							<option value="">选择</option>
							<option value="1">是</option>
							<option value="0">否</option>
					</select> &nbsp;&nbsp; 置顶 <select name="s_istop" class="input"
						onchange="changesearch()"
						style="width: 60px; line-height: 17px; display: inline-block">
							<option value="">选择</option>
							<option value="1">是</option>
							<option value="0">否</option>
					</select>
					</li>
					<if condition="$iscid eq 1">
					<li><select name="cid" class="input"
						style="width: 200px; line-height: 17px;" onchange="changesearch()">
							<option value="">请选择分类</option>
							<option value="">产品分类</option>
							<option value="">产品分类</option>
							<option value="">产品分类</option>
							<option value="">产品分类</option>
					</select></li>
					</if>
					<li><input type="text" placeholder="请输入搜索关键字" name="keywords"
						class="input"
						style="width: 250px; line-height: 17px; display: inline-block" />
						<a href="javascript:void(0)"
						class="button border-main icon-search" onclick="changesearch()">
							搜索</a></li>
				</ul>
			</div>
			<table class="table table-hover text-center">
				<tr>
					<th width="100" style="text-align: left; padding-left: 20px;">ID</th>
					<th>用户姓名</th>
					<th>账户</th>
					<th>locked</th>
					<th width="10%">创建时间</th>
					<th width="310">操作</th>
				</tr>
				<tbody  id="userTbody"> <c:forEach
					items="${user_dbList}" var="user">
					<tr>
						<td name ="userId" style="text-align: left; padding-left: 20px;" id="userId"><input type='checkbox' name='userId3' value='${user.userId}' /> ${user.userId}</td>
						<td name="username" id="username">${user.username}</td>
						<td name="account" id="account">${user.account}</td>
						<td name="locked" id="locked">${user.locked}</td>
						<td name="createTime" id="createTime">${user.createTime}</td>
						<td>
							<div class="button-group">
								<button type="button" id="${user.userId}"
										class="button border-main icon-plus-square-o"
										data-toggle="modal" data-target="#editUser" name="update">修改</button>

								<a class="button border-red"
									href="<%=basePath%>system/userDelete?userId=${user.userId}"
									onclick="return del(1,1,1)"><span class="icon-trash-o"></span>
									删除</a>
							</div>
						</td>
					</tr>
					</tbody>
				</c:forEach>

				<tr>
					<td style="text-align: left; padding: 19px 0; padding-left: 20px;"><input
						type="checkbox" id="checkall" /> 全选</td>
					<td colspan="7" style="text-align: left; padding-left: 20px;">
					<!-- 批量删除 -->
						<a
						href="javascript:void(0)" class="button border-red icon-trash-o"
						style="padding: 5px 15px;" onclick="DelSelect()"> 删除</a>
							
						
						<a href="javascript:void(0)"
							style="padding: 5px 15px; margin: 0 10px;"
							class="button border-blue icon-edit" onclick="sorts()"> 排序</a> 操作：
						<select name="ishome"
						style="padding: 5px 15px; border: 1px solid #ddd;"
						onchange="changeishome(this)">
							<option value="">首页</option>
							<option value="1">是</option>
							<option value="0">否</option>
					</select> <select name="isvouch"
						style="padding: 5px 15px; border: 1px solid #ddd;"
						onchange="changeisvouch(this)">
							<option value="">推荐</option>
							<option value="1">是</option>
							<option value="0">否</option>
					</select> <select name="istop"
						style="padding: 5px 15px; border: 1px solid #ddd;"
						onchange="changeistop(this)">
							<option value="">置顶</option>
							<option value="1">是</option>
							<option value="0">否</option>
					</select> &nbsp;&nbsp;&nbsp; 移动到： <select name="movecid"
						style="padding: 5px 15px; border: 1px solid #ddd;"
						onchange="changecate(this)">
							<option value="">请选择分类</option>
							<option value="">产品分类</option>
							<option value="">产品分类</option>
							<option value="">产品分类</option>
							<option value="">产品分类</option>
					</select> <select name="copynum"
						style="padding: 5px 15px; border: 1px solid #ddd;"
						onchange="changecopy(this)">
							<option value="">请选择复制</option>
							<option value="5">复制5条</option>
							<option value="10">复制10条</option>
							<option value="15">复制15条</option>
							<option value="20">复制20条</option>
					</select></td>
				</tr>
				
				<tr>
					<td colspan="8"><div class="pagelist">
						<div style="text-align: center" >
						    <ul class="pagination">
							<!--  <p style="margin-left: 10%">共${page.pages}页,当前是第${page.pageNum}页</p> -->
							<li>共${userpage.pages}页,当前是第${userpage.pageNum}页<li><br>
							<a href="http://localhost:8080/crm/system/userList?page=${userpage.firstPage}" onclick="changecolor(1)">首页</a>
							<a href="http://localhost:8080/crm/system/userList?page=${userpage.prePage}" onclick="changecolor(${userpage.pageNum}-1)">上一页</a>
							<c:forEach begin="1" end="${userpage.pages}" var="pageNumber">
									<a href="http://localhost:8080/crm/system/userList?page=${pageNumber}&size=3">
								    <%--判断：主要是为了给当前页显示红色--%> <c:choose>
										<c:when test="${pageNumber==userpage.pageNum}">
											<span style="color: red">${pageNumber}</span>
											</c:when>
											<c:otherwise>${pageNumber}</c:otherwise>
										</c:choose>
									</a>
							</c:forEach>
							<a  href="http://localhost:8080/crm/system/userList?page=${userpage.pageNum+1}" onclick="changecolor(${userpage.pageNum}+1)">下一页</a>			
							<a href="http://localhost:8080/crm/system/userList?page=${userpage.lastPage}" onclick="changecolor(${userpage.pages})">尾页</a>
		         		</ul> 
					      </div>
					</td>
				</tr>
			</table>
		</div>
	</form>
	





	<!-- addUser -->
	<div class="modal fade bs-example-modal-lg" id="addUser" tabindex=""
		role="dialog" aria-labelledby="myModalLabel">
		<div class="modal-dialog modal-lg" role="document">
			<div class="modal-content">
				<div class="modal-header" style="text-align: center">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close"></button>
					<h4 class="modal-title" id="myLargeModalLabel">用户</h4>
				</div>
				<div class="modal-body">
					<input id="userId" type="hidden" name="userId" />
					<div class="row">
						<div class="col-md-3" style="text-align: right">
							<label style="margin-top: 10px">用户名：</label>
						</div>
						<div class="col-md-9">
							<input id="name" type="text" class="input" name="username"
								value="" />
						</div>
					</div>
					<div class="row">
						<div class="col-md-3" style="text-align: right">
							<label style="margin-top: 10px">账户名：</label>
						</div>
						<div class="col-md-9">
							<input id="name" type="text" class="input" name="account"
								value="" />
						</div>
					</div>
					<div class="row">
						<div class="col-md-3" style="text-align: right">
							<label style="margin-top: 10px">密码：</label>
						</div>
						<div class="col-md-9">
							<input id="name" type="text" class="input" name="password"
								value="" />
						</div>
					</div>
					<div class="row">
						<div class="col-md-3" style="text-align: right">
							<label style="margin-top: 10px">职位：</label>
						</div>
						<div class="col-md-9">
							<select name="roleId" class="input w50" ><option value="">--请选择角色--</option>
								<c:forEach items="${role_dbList}"  var="role">
									<option value="${role.roleId}">${role.roleName}</option>
						</c:forEach></select>

							</select>
						</div>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
						<button type="button" class="btn btn-primary" onclick="pushData()"
							style="">保存</button>
					</div>

				</div>
			</div>
		</div>
	</div>



	<!-- editUser -->
	<div class="modal fade bs-example-modal-lg" id="editUser" tabindex=""
		role="dialog" aria-labelledby="myModalLabel">
		<div class="modal-dialog modal-lg" role="document">
			<div class="modal-content">
				<div class="modal-header" style="text-align: center">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close"></button>
					<h4 class="modal-title" id="myLargeModalLabel">用户</h4>
				</div>
				
				<div class="modal-body">
					<input id="userId2" type="hidden" name="userId2" />
				
					<div class="row">
						<div class="col-md-3" style="text-align: right">
							<label style="margin-top: 10px">用户名：</label>
						</div>
						<div class="col-md-9">
							<input id="name" type="text" class="input" name="username2"
								value="" />
						</div>
					</div>
					
					<div class="row">
						<div class="col-md-3" style="text-align: right">
							<label style="margin-top: 10px">账户名：</label>
						</div>
						<div class="col-md-9">
							<input id="name" type="text" class="input" name="account2"
								value="" />
						</div>
					</div>
										
					<div class="row">
						<div class="col-md-3" style="text-align: right">
							<label style="margin-top: 10px">职位：</label>
						</div>
						<div class="col-md-9">
							<select name="roleId2" class="input w50" ><option value="">--请选择角色--</option>
								<c:forEach items="${role_dbList}" var="role">
									<option value="${role.roleId}">${role.roleName}</option>
						</c:forEach>
								
							</select>
						</div>
					</div>

					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
						<button type="button" class="btn btn-primary" onclick="editData()"
							style="">保存</button>
					</div>

				</div>
			</div>
		</div>
	</div>

	
	<script type="text/javascript">
	
	</script>
</body>
</html>