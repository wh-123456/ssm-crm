<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<html>
<head>
<base href="<%=basePath%>" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, customer-scalable=no" />
<meta name="renderer" content="webkit">
<title>客户管理</title>
<link rel="stylesheet" href="<%=basePath%>static/css/pintuer.css">
<link rel="stylesheet" href="<%=basePath%>static/css/admin.css">
<link rel="stylesheet" href="<%=basePath%>static/css/bootstrap.min.css">
<link rel="stylesheet"
	href="<%=basePath%>static/css/customer/customer.css">
<script src="<%=basePath%>static/js/jquery.js"></script>
<script src="<%=basePath%>static/js/bootstrap.js"></script>
<script src="<%=basePath%>static/js/pintuer.js"></script>
<script src="<%=basePath%>static/js/zdl/customerList.js"></script>
</head>
<body>
	<form method="post" action="" id="listform">
		<div class="panel admin-panel text-center">
			<div class="panel-head">
				<strong style="font-size: 30px"> 客户列表</strong>
			</div>
			<div class="line">
				<div class="x1 text-center">
					<label class="height-large ">客户名称：</label>
				</div>
				<div class="x1 text-center">
					<input type="text" name="searchName" class="input" />
				</div>
				<div class="x1 text-center">
					<label class="height-large ">客户来源：</label>
				</div>
				<div class="x2 text-center">
					<select id="source" class="input"><option value="">--请选择--</option>
						<c:forEach items="${map.source }" var="source">
							<option value="${source }">${source }</option>
						</c:forEach></select>
				</div>

				<div class="x1 text-center">
					<label class="height-large ">所属行业：</label>
				</div>
				<div class="x2 text-center">
					<select id="industry" class="input"><option value="">--请选择--</option>
						<c:forEach items="${map.industry }" var="industry">
							<option value="${industry }">${industry }</option>
						</c:forEach></select>
				</div>
				<div class="x1 text-center">
					<label class="height-large ">客户级别：</label>
				</div>
				<div class="x2 text-center">
					<select id="level" class="input"><option value="">--请选择--</option>
						<c:forEach items="${map.level }" var="level">
							<option value="${level }">${level }</option>
						</c:forEach></select>
				</div>
				<div class="x1 text-center">
					<button type="button"
						class="button button-big  bg-main icon-search" name="search">
						查询</button>
				</div>
			</div>
			<div class="padding border-botton">
				<ul class="search" style="padding-left: 10px;">
					<li><button type="button" name="add"
							class="button border-main icon-plus-square-o" data-toggle="modal"
							data-target="#addCustomer">添加客户</button></li>
					<li><button type="button" class="button border-red"
							onclick="delSelect()">
							<span class="icon-trash-o"></span>批量删除
						</button></li>
					<li><button type="button" class=" button" id="reversCheck"
							>反选</button></li>
					<li><button type="button" class="icon-plus button"
							data-toggle="modal" data-target="#addSIL"></button></li>



				</ul>
			</div>
			<div class="big-box">
				<table class="table table-hover table-bordered text-center tbl">
					<thead>
						<tr class="blue">
							<th width="4%"><input type="checkbox"
								onclick="checkAll(this)" /> ID</th>
							<th width="6%">客户名称</th>
							<th width="8%">客户来源</th>
							<th width="10%">客户所属行业</th>
							<th width="8%">客户级别</th>
							<th width="6%">固定电话</th>
							<th >手机</th>
							<th>邮箱</th>
							<th >联系地址</th>
							<th width="8%">操作</th>
						</tr>
					</thead>
					<tbody id="customerList">
						<%-- <c:forEach items="${customers.list }" var="customer">
							<tr>

								<td id="id"><input type="checkbox" name="id[]" value="" />${customer.id }</td>
								<td id="name">${customer.name }</td>
								<td id="source">${customer.source }</td>
								<td id="industry">${customer.industry }</td>
								<td id="level">${customer.level }</td>
								<td id="phone">${customer.phone }</td>
								<td id="tellPhone">${customer.tellPhone }</td>
								<td id="email">${customer.email }</td>
								<td id="address">${customer.address}</td>
								<td style="width: 20%"><div class="button-group">
										<button type="button" id="${customer.id }"
											class="button border-main icon-plus-square-o"
											data-toggle="modal" data-target="#addCustomer" name="update">修改</button>

										<button class="button border-red" onclick="del(this)">
											<span class="icon-trash-o"></span> 删除
										</button>
									</div></td>
							</tr>
						</c:forEach> --%>
					</tbody>


				</table>
			</div>
			<div class="box-footer line">
				<div class="">
					<div class="form-group form-inline" id="totalPage">
						<%-- 	总共${customers.pages}页，共${customers.total} 条数据。 每页 <select
							class="form-control" onchange="gotoPage(1,this.value)">
							<c:forEach var="temp" begin="1" end="10">
								<option ${customers.pageSize==temp?'selected':''}
									value="${temp}">${temp}</option>
							</c:forEach>
						</select> 条 --%>
					</div>
				</div>
				<div class="box-tools">
					<ul class="pagination">
						<%-- <li><a
							href="<%=basePath%>customer/list?pageNum=1&pageSize=${customers.pageSize}"
							aria-label="Previous">首页</a></li>
						<li><a
							href="<%=basePath%>customer/list?pageNum=${customers.prePage}&pageSize=${customers.pageSize}">上一页</a></li>

						处理页码
						<c:forEach var="num"
							begin="${(customers.pageNum-5>0?(customers.pageNum-5):1)}"
							end="${(customers.pageNum+5<=customers.pages)?(customers.pageNum+5):customers.pages}">

							<li><a
								href="<%=basePath%>customer/list?pageNum=${num}&pageSize=${customers.pageSize}">
									判断：主要是为了给当前页显示红色 <c:choose>
										<c:when test="${num==customers.pageNum}">
											<span style="color: red">${num}</span>
										</c:when>
										<c:otherwise>${num}</c:otherwise>
									</c:choose>

							</a></li>

						</c:forEach>

						<li><a
							href="<%=basePath%>customer/list?pageNum=${customers.nextPage}&pageSize=${customers.pageSize}">下一页</a></li>
						<li><a
							href="<%=basePath%>customer/list?pageNum=${customers.nextPage}&pageSize=${customers.pageSize}"
							aria-label="Next">尾页</a></li> --%>
					</ul>
				</div>
			</div>
		</div>
	</form>

	<!-- addCustomer -->
	<div class="modal fade bs-example-modal-lg" id="addCustomer"
		tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
		<div class="modal-dialog " role="document">
			<div class="modal-content">
				<div class="modal-header" style="text-align: center">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close"></button>
					<h4 class="modal-title" id="myModalLabel">新增用户</h4>
				</div>

				<div class="modal-body">
					<input id="id" type="hidden" name="id" />

					<div class="row">
						<div class="col-md-3" style="text-align: right">
							<label style="margin-top: 10px">客户名称：</label>
						</div>
						<div class="col-md-9">
							<input type="text" class="input" name="tname" value="" />
						</div>
					</div>

					<div class="row">
						<div class="col-md-3" style="text-align: right">
							<label style="margin-top: 10px">客户来源：</label>
						</div>
						<div class="col-md-9">
							<select class="input" name="source">
								<option value="">--请选择--</option>
								<c:forEach items="${map.source }" var="source">
									<option value="${source }">${source }</option>
								</c:forEach>
							</select>
						</div>
					</div>
					<div class="row">
						<div class="col-md-3" style="text-align: right">
							<label style="margin-top: 10px">所属行业：</label>
						</div>
						<div class="col-md-9">
							<select class="input" name="industry">
								<option value="">--请选择--</option>
								<c:forEach items="${map.industry }" var="industry">
									<option value="${industry }">${industry }</option>
								</c:forEach>
							</select>
						</div>
					</div>
					<div class="row">
						<div class="col-md-3" style="text-align: right">
							<label style="margin-top: 10px">客户级别：</label>
						</div>
						<div class="col-md-9">
							<select class="input" name="level">
								<option value="">--请选择--</option>
								<c:forEach items="${map.level }" var="level">
									<option value="${level }">${level }</option>
								</c:forEach>
							</select>
						</div>
					</div>
					<div class="row">
						<div class="col-md-3" style="text-align: right">
							<label style="margin-top: 10px">固定电话：</label>
						</div>
						<div class="col-md-9">
							<input type="text" class="input" name="phone" value="" />
						</div>
					</div>
					<div class="row">
						<div class="col-md-3" style="text-align: right">
							<label style="margin-top: 10px">移动电话：</label>
						</div>
						<div class="col-md-9">
							<input type="text" class="input" name="tellPhone" value="" />
						</div>
					</div>
					<div class="row">
						<div class="col-md-3" style="text-align: right">
							<label style="margin-top: 10px">邮政编码：</label>
						</div>
						<div class="col-md-9">
							<input type="text" class="input" name="email" value="" />
						</div>
					</div>
					<div class="row">
						<div class="col-md-3" style="text-align: right">
							<label style="margin-top: 10px">联系地址：</label>
						</div>
						<div class="col-md-9">
							<input type="text" class="input" name="address" value="" />
						</div>
					</div>
				</div>


				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					<button type="button" class="btn btn-primary" name="submit"
						onclick="pushData()">保存</button>
				</div>

			</div>
		</div>
	</div>

	<!-- addSIL -->
	<div class="modal fade bs-example-modal-lg" id="addSIL" tabindex="-1"
		role="dialog" aria-labelledby="myModalLabel">
		<div class="modal-dialog  " role="document">
			<div class="modal-content">
				<div class="modal-header text-center">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close"></button>
					<h4 class="modal-title" id="myLabel">新增客户来源/所属行业/客户级别</h4>
				</div>

				<div class="modal-body">


					<div class="row">
						<div class="col-md-3" style="text-align: right">
							<select class="input" name="addSIL">
								<option value="客户来源">客户来源</option>
								<option value="所属行业">所属行业</option>
								<option value="客户级别">客户级别</option>
							</select>
						</div>
						<div class="col-md-8">
							<input id="dictName" type="text" class="input" name="dictName"
								value="" />
						</div>
						<div class="col-md-1">
							
						</div>
					</div>
				</div>

				<div class="modal-footer" style="heght: 50px">
					<a herf="<%=basePath%>customerController/manager/list"><button
							type="button" class="btn btn-default" data-dismiss="modal">关闭</button></a>
					<button type="button" class="btn btn-primary" data-dismiss="modal"
						onclick="addSIL()">保存</button>
				</div>

			</div>
		</div>
	</div>

	<script type="text/javascript">
		gotoPage(1, 8);
	</script>
</body>
</html>