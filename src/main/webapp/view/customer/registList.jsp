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
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, regist-scalable=no" />
<meta name="renderer" content="webkit">
<title>客户管理</title>
<link rel="stylesheet" href="<%=basePath%>static/css/pintuer.css">
<link rel="stylesheet" href="<%=basePath%>static/css/admin.css">
<link rel="stylesheet" href="<%=basePath%>static/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" media="screen"
	href="<%=basePath%>static/css/ui.jqgrid-bootstrap.css" />
<link rel="stylesheet"
	href="<%=basePath%>static/css/bootstrap-datetimepicker.min.css">
<%-- <link rel="stylesheet"
	href="<%=basePath%>static/css/regist/regist.css"> --%>
<script src="<%=basePath%>static/js/jquery.js"></script>
<script src="<%=basePath%>static/js/bootstrap.js"></script>
<script src="<%=basePath%>static/js/pintuer.js"></script>
<script src="<%=basePath%>static/js/zdl/registList.js"></script>
<script type="text/ecmascript"
	src="<%=basePath%>static/js/jquery.jqGrid.min.js"></script>
<script type="text/javascript"
	src="<%=basePath%>static/js/moment-with-locales.min.js"></script>
<script type="text/javascript"
	src="<%=basePath%>static/js/order/sweet-alert.min.js"></script>
<script type="text/javascript"
	src="<%=basePath%>static/js/bootstrap-datetimepicker.min.js"></script>
</head>
<body>
	<form method="post" action="" id="listform">
		<div class="panel admin-panel text-center">
			<div class="panel-head">
				<strong style="font-size: 30px"> 产品生产管理</strong>
			</div>
			<div class="padding border-bottom">
				<ul class="search" style="padding-left: 10px;">
					<li><button type="button" name="add"
							class="button border-main icon-plus-square-o" data-toggle="modal"
							data-target="#addRegist" onclick="emptyModel()">添加新登记表</button></li>
					<li><button type="button" class="button border-red"
							onclick="deleteMany()">
							<span class="icon-trash-o"></span>批量删除
						</button></li>
					<li><button type="button" class=" button" id="reversCheck">反选</button></li>

					<li class="row"><input type="text" placeholder="请输入搜索关键字"
						name="keyword" class="input"
						style="width: 250px; line-height: 17px; display: inline-block" />

						<button type="button" class="button border-main icon-search"
							onclick="changeSearch()">
							查询</a></li>




				</ul>
				<div></div>
			</div>
			<div class="big-box">
				<table class="table table-hover table-bordered text-center tbl">
					<thead>
						<tr class="blue">
							<th width="4%"><input type="checkbox" id="ckA"
								onclick="checkAll(this)" /> 编号</th>
							<th>生产编号</th>
							<th>产品名称</th>
							<th>生产数量</th>
							<th>生产日期</th>
							<th>状态</th>
							<th>操作</th>
						</tr>
					</thead>
					<tbody id="registList">

					</tbody>


				</table>
			</div>
			<div class="box-footer line">
				<div class="">
					<div class="form-group form-inline" id="totalPage"></div>
				</div>
				<div class="box-tools">
					<ul class="pagination">

					</ul>
				</div>
			</div>
		</div>
	</form>

	<!-- addregist -->
	<div class="modal fade bs-example-modal-lg" id="addRegist"
		tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
		<div class="modal-dialog modal-lg" role="document">
			<div class="modal-content">
				<div class="modal-header" style="text-align: center">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close"></button>
					<h4 class="modal-title" id="myModalLabel">添加新登记单</h4>
				</div>

				<div class="modal-body">
					<div class="row">
						<div class="col-md-2" style="text-align: right">
							<label style="margin-top: 10px">产品名称：</label>
						</div>
						<div class="col-md-10 field">
							<select name="productName" class="input">
								<c:forEach items="${products }" var="product">
									<option value="${product.productName }">${product.productName }</option>
								</c:forEach>
							</select>
						</div>
					</div>
					<div class="row">
						<div class="col-md-2" style="text-align: right">
							<label style="margin-top: 10px">生产商名称：</label>
						</div>
						<div class="col-md-10 field">
							<input type="text" class="input" name="producer" value="" />
						</div>

					</div>
					<div class="row">
						<div class="col-md-2" style="text-align: right">
							<label style="margin-top: 10px">生产编号：</label>
						</div>
						<div class="col-md-4 field">
							<input type="text" class="input" name="productionId" value="" disabled="disabled"/>
						</div>
						<div class="col-md-2" style="text-align: right">
							<label style="margin-top: 10px">生产日期：</label>
						</div>
						<div class="col-md-4 field has-feedback">
							<div class='input-group date'>
								<input type='text' class="input" name="produceDate" /> <span
									class="input-group-addon"> <span class="icon-calendar"></span>
								</span>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-md-2" style="text-align: right">
							<label style="margin-top: 10px">生产数量：</label>
						</div>
						<div class="col-md-4 field">
							<input type="text" class="input" name="produceNumber" value="" />
						</div>
						<div class="col-md-2" style="text-align: right">
							<label style="margin-top: 10px">产品单价：</label>
						</div>
						<div class="col-md-4 field">
							<input type="text" class="input" name="price" value=""
								disabled="disabled" />
						</div>
					</div>
					<div class="row">
						<div class="col-md-2" style="text-align: right">
							<label style="margin-top: 10px">生产规格：</label>
						</div>
						<div class="col-md-4 field">
							<input type="text" class="input" name="size" value=""
								disabled="disabled" />
						</div>
						<div class="col-md-2" style="text-align: right">
							<label style="margin-top: 10px">入库日期：</label>
						</div>
						<div class="col-md-4 field has-feedback">
							<div class='input-group date'>
								<input type='text' class="input" name="storageDate" /> <span
									class="input-group-addon"> <span class="icon-calendar"></span>
								</span>
							</div>
							<!-- <input type="text" class="input" name="storageDate" value="" /> -->
						</div>
					</div>
					<div class="row">
						<div class="col-md-2" style="text-align: right">
							<label style="margin-top: 10px">经手人：</label>
						</div>
						<div class="col-md-4 field">
							<input type="text" class="input" name="handerName" value="" />
						</div>
						<div class="col-md-2" style="text-align: right">
							<label style="margin-top: 10px">操作员：</label>
						</div>
						<div class="col-md-4 field">
							<input type="text" class="input" name="operator" value="${USER.account}" disabled="disabled"/>
						</div>
					</div>
					<div class="row">
						<div class="col-md-2" style="text-align: right">
							<label style="margin-top: 10px">备注：</label>
						</div>
						<div class="col-md-10">
							<textarea rows="3" cols="110" class="input" name="remark"></textarea>
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


	<script type="text/javascript">
		gotoPage(1, 6);
	</script>
</body>
</html>