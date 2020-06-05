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
<title>权限管理</title>
<script src="<%=basePath%>static/js/jquery.js"></script>
<link rel="stylesheet" href="<%=basePath%>static/css/pintuer.css">
<link rel="stylesheet" href="<%=basePath%>static/css/admin.css">
<link rel="stylesheet" href="<%=basePath%>static/css/bootstrap.min.css">
<script src="<%=basePath%>static/js/bootstrap.js"></script>
<script src="<%=basePath%>static/js/pintuer.js"></script>

</head>
<body>
	
		<div class="panel admin-panel">
			<div class="panel-head" >
			   
				 <strong class="icon-reorder"> 权限管理</strong> 
				 <a href="" style="float: right; display: none;">添加字段</a>
			     <button  class="btn btn-link icon-home" onclick="homeBack()">主界面</button>
			     <button class="btn btn-link icon-reply" onclick="history.back()">后退</button>
			</div>
			<div class="padding border-bottom">
				<ul class="search" style="padding-left: 10px;">
					<li><button type="button" name="add"
							class="button border-main icon-plus-square-o" data-toggle="modal"
							data-target="#addPermission">添加权限</button></li>
					<li><button class="button border-red" onclick="delSelect()"><span class="icon-trash-o" ></span>批量删除
					</button></li>
					<!-- <a class="button border-main icon-plus-square-o"
						href="<%=basePath%>view/system/role/addRole.jsp"> 增加</a> -->
						<li><input type="text" placeholder="请输入搜索关键字"  id="findPer" />
						<button onclick="findPermission()" class="button border-blue" >
						<span class="icon-search">搜索</span></button></li>
				</ul>
				
			</div>
			<table class="table table-hover text-center">
				<tr>
				    
					<td><input type="checkbox" name="selectall" id="selectall" value="选择全部" />请选择</td>
					<th>对应ID</th>
					<th>父ID</th>
					<th>权限</th>
					<th>url</th>
					<th>percode</th>
					<th>创建时间</th>
					<th width="310">操作</th>
				</tr>
				<tbody name="list" id="vo"> 
				<c:forEach items="${ps}" var="ps" varStatus="vs">
					<tr>
						
						<td><input type="checkbox" name="del" value="${ps.permissionId}" id="${vs.count+5*(page.pageNum-1)}"/>${vs.count+5*(page.pageNum-1)}</td>
						<td id="num" name="${ps.name}" value="${ps.permissionId}">${ps.permissionId}</td>
						<td id="id" >${ps.pId }</td>
						<td id="name">${ps.name}</td>
						<td id="url">${ps.url}</td>
						<td id="percode">${ps.percode}</td>
						<td id="createTime">${ps.createTime}</td>  
						<td id="deleteandupdate" perId="${ps.permissionId}" style="width: 20%"><div class="button-group">
								<button type="button" id="${ps.pId }"
									class="button border-main icon-plus-square-o"
									data-toggle="modal" data-target="#updatepermission"  name="update" >修改</button>

								<button class="button border-red" onclick="delMethod(${ps.permissionId},${vs.count+5*(page.pageNum-1)})">
									<span class="icon-trash-o"></span> 删除
								</button>
							</div></td>
					</tr>
				 </c:forEach>
				</tbody> 
			</table>
		</div>
		<!-- 分页栏 -->
		  <div style="text-align: center" id="page">
		    <ul class="pagination">
			<!--  <p style="margin-left: 10%">共${page.pages}页,当前是第${page.pageNum}页</p> -->
			<li>共${page.pages}页,当前是第${page.pageNum}页<li><br>
			<a href="<%=request.getContextPath()%>/system/permissionList?name=${name}&page=${page.firstPage}" onclick="changecolor(1)">首页</a>
			<a href="<%=request.getContextPath()%>/system/permissionList?name=${name}&page=${page.prePage}" onclick="changecolor(${page.pageNum}-1)">上一页</a>
			<c:forEach begin="1" end="${page.pages}" var="pageNumber">
					<a href="<%=request.getContextPath()%>/system/permissionList?name=${name}&page=${pageNumber}&size=5">
				    <%--判断：主要是为了给当前页显示红色--%> <c:choose>
						<c:when test="${pageNumber==page.pageNum}">
							<span style="color: red">${pageNumber}</span>
							</c:when>
							<c:otherwise>${pageNumber}</c:otherwise>
						</c:choose>
					</a>
			</c:forEach>
			<a  href="<%=request.getContextPath()%>/system/permissionList?name=${name}&page=${page.pageNum+1}" onclick="changecolor(${page.pageNum}+1)">下一页</a>			
			<a href="<%=request.getContextPath()%>/system/permissionList?name=${name}&page=${page.lastPage}" onclick="changecolor(${page.pages})">尾页</a>
	         </ul> 
	      </div>
	

	<!-- addPermission -->
	<div class="modal fade bs-example-modal-lg" id="addPermission"
		tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel">
		<div class="modal-dialog modal-lg" role="document">
			<div class="modal-content">
				<div class="modal-header" style="text-align: center">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close"></button>
					<h4 class="modal-title" id="myLargeModalLabel">新增权限</h4>
				</div>

				<div class="modal-body">

					<div class="row">
						<div class="col-md-2" style="text-align: right">
							<label style="margin-top: 10px">父ID：</label>
						</div>
						<div class="col-md-6">
							<select id="addpId" class="input">
								    <option name="addid" value="-1" class="option" >请选择父类ID</option>
								<c:forEach items="${pslist}" var="perm">
									<option name="addid" value="${perm.permissionId}" class="option" ">${perm.name}</option>
								</c:forEach>

							</select>
						</div>
					</div>
					<div class="row">
						<div class="col-md-2" style="text-align: right">
							<label style="margin-top: 10px">权限名称：</label>
						</div>
						<div class="col-md-6">
							<input id="addname" type="text" οnblur="checkName()" class="input" name="name" value="" />
						</div>
						<div class="col-md-4" id="d2">
			  				
						</div>
					</div>
					<div class="row">
						<div class="col-md-2" style="text-align: right">
							<label style="margin-top: 10px">url：</label>
						</div>
						<div class="col-md-6">
							<input id="addurl" type="text" class="input" name="url" value="" />
						</div>
						<div class="col-md-4" id="d3">
			  
						</div>
					</div>
					<div class="row">
						<div class="col-md-2" style="text-align: right">
							<label style="margin-top: 10px">percode：</label>
						</div>
						<div class="col-md-6">
							<input id="addpercode" type="text" class="input" name="percode" value="" />
						</div>
						<div class="col-md-4" id="d4">
			  
						</div>
					</div>
				</div>


				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					<button type="button" id="addbuton" class="btn btn-primary" onclick="addPermissionMethod(${5*(page.pageNum)})" style="pointer-events：auto;">保存</button>
				</div>

			</div>
		</div>
	</div>

	<!-- updatePermisssion -->
	 <div class="modal fade bs-example-modal-lg" id="updatepermission"
		tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel">
		<div class="modal-dialog  modal-lg" role="document">
			<div class="modal-content">
				<div class="modal-header" style="text-align: center">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close"></button>
					<h4 class="modal-title" id="myModalLabel">修改权限</h4>
				</div>

				<div class="modal-body">
					<div class="row">
						<div class="col-md-2" style="text-align: right">
							<label style="margin-top: 10px">父ID：</label>
						</div>
						<div class="col-md-6">
							<select id="updatepId"  name="updatepId"  class="input">
								    <option name="updateid" value="-1" class="option" >请选择父类ID</option>
								<c:forEach items="${pslist}" var="perm">
									<option name="updateid" id="per${perm.permissionId}" value="${perm.permissionId}" class="option" >${perm.name}</option>
								</c:forEach>
							</select>
						</div>
					</div>
					<div class="row">
						<div class="col-md-2" style="text-align: right">
							<label style="margin-top: 10px">权限名称：</label>
						</div>
						<div class="col-md-6">
							<input id="updatename" type="text" class="input" name="updatename" value="" />
						</div>
						<div class="col-md-4" id="d2">
			  				
						</div>
					</div>
					<div class="row">
						<div class="col-md-2" style="text-align: right">
							<label style="margin-top: 10px">url：</label>
						</div>
						<div class="col-md-6">
							<input id="updateurl" type="text" class="input" name="updateurl" value="" />
						</div>
						<div class="col-md-4" id="d2">
			  				
						</div>
					</div>
					<div class="row">
						<div class="col-md-2" style="text-align: right">
							<label style="margin-top: 10px">percode：</label>
						</div>
						<div class="col-md-6">
							<input id="updatepercode" type="text" class="input" name="updatepercode" value="" />
						</div>
						<div class="col-md-4" id="d2">
			  				
						</div>
					</div>
				</div>

				<div class="modal-footer" style="heght: 50px">
					<a herf="<%=basePath%>customerController/manager/list"><button
							type="button" class="btn btn-default" data-dismiss="modal">关闭</button></a>
					<button type="button" class="btn btn-primary"
						onclick="pushData(${5*(page.pageNum)})" id="updatebutton">保存</button>
				</div>

			</div>
		</div>
	</div>



	<script type="text/javascript">
	function homeBack(){
		window.location.href="http://localhost:8080/crm/system/permissionList"; 
	}
	//新增权限	
	function addPermissionMethod(page){
			var id=$("#addpId").val();
			var name=$("#addname").val();
			var url=$("#addurl").val();
			var percode=$("#addpercode").val();
			$.ajax({
				url:"http://localhost:8080/crm/system/permissionAdd",
				type: "post",
				data : {pId:id,name:name,url:url,percode:percode
				},
				success : function(data) {
					if(data>0){
						var pageNum=Math.floor(page/5)
						alert("新增成功");
						//这是返回上一页面
						//location.href=document.referrer;
						//刷新当前页面
						window.location.reload();
					}else{
						alert("新增失败")
					}
							},
						error : function() {
							alert("新增请求失败");
						}
					})
	         }
	
	    //删除单个
		function delMethod(num,page) {
	    	
			if (confirm("您确定要删除吗?")) {
				$.ajax({
					url:"http://localhost:8080/crm/system/permissionDelete",
					type : "get",
					data : {
						id: num
					},
					success : function(data) {
						if (data>0) {
							alert("删除成功");
							window.location.reload();
							
						} else {
							alert("删除失败！！！");
						}
					},
					error : function() {
						alert("删除请求失败");
					}

				})
			}
		}
		//批量删除
		function delSelect() {
			var Checkbox = false;
			var checkId=[];
			var pageNum=0;
			//获取所有被选中的元素的value(),value值被设置为其permissionId
			$("input[name='del']").each(function(i) {
				if (this.checked == true) {
					Checkbox = true;
					checkId[i]=$(this).val();
			        pageNum=Math.ceil($(this).attr("id")/5);
			         
				}
			});
			if (Checkbox) {
				if( confirm("您确认要删除选中的内容吗？")){
						$.ajax({
							url:"http://localhost:8080/crm/system/deleteSome",
							type : "get",
							data : {
								checkId: checkId
							},
							success : function(data) {
								if (data>0) {
									alert("删除成功"); 
									window.location.reload();
										
								} else {
									alert("删除失败！！！");
								}
								
							},
							
							error : function() {
								alert("删除请求失败");
							}

						})
						
					}
			} else {
				alert("请选择您要删除的内容!");
				return false;
			}
		}
		//修改权限信息
		//使用ajax刷新后获取button点击事件要使用.on('click','#XXX',function(){})
		$(document).on('click',"button[name='update']",function(){
			 var perId=$(this).parents("tr").find("#num").text();
			 var name=$(this).parents("tr").find("#name").text();
			 var url=$(this).parents("tr").find("#url").text();
			 var percode=$(this).parents("tr").find("#percode").text();
			 //获取此修改对象的父ID
			 var pId=$(this).parents("tr").find("#id").text();
			 //父权限名
			/*  var pName
			 //遍历permissionId,获取对应的父权限名
			 $("td[id='num']").each(function(){
				 //判断改权限的父ID与权限列表中哪一对象匹配
				 //在此不能使用$(this).val()作为判断依据
				 if($(this).attr("value")==pId){
					 pName=$(this).attr("name")
				 }
			 }) */
			 
			 //设置option框被选中
			 $("#per"+pId).attr("selected",'selected');
			 //这里是修改了此标签里自定义属性的值，使其为对应的permissionId，方便下面获取
			 $("[name=updateid]").attr("pId",perId);
			 //$("[name='updatepId']").val(pName)
			 $("[name=updatename]").val(name);
			 $("[name=updateurl]").val(url);
			 $("[name=updatepercode]").val(percode);
			 
		})
		function pushData(page){
			 //获取上面设置的pId属性的值
			 var perId=$("[name=updateid]").attr("pId");
			 
			 //获取上面设置后显示的对应的值
			 var id= $("#updatepId").val();
			 var name=$("[name=updatename]").val();
			 var url= $("[name=updateurl]").val();
			 var percode= $("[name=updatepercode]").val();
				$.ajax({
					 url:"http://localhost:8080/crm/system/permissionEidt",
					 type:"post",
					 data:{
						 permissionId:perId,
						 pId:id,
						 name:name,
						 url:url,
						 percode:percode
					 },
					 success:function(data){
						 if(data>0){
							 var pageNum=Math.floor(page/5)
							 alert("修改成功");
							 window.location.reload();
						 
						 }else{
							 alert("修改失败");
						 }
						 
					 },
					 error:function(data){
						 alert("修改请求失败");
					 }
				 })
			
		}
		
		//模糊查询
		function findPermission(){
			var name=$("#findPer").val();
			if(name!=""){
				
				$.ajax({
					 url:"http://localhost:8080/crm/system/findpermissionList",
					 type:"get",
					 data:{
						name:name
					 },
					 success:function(){
						 alert("查询成功");
						 window.location.href="http://localhost:8080/crm/system/permissionList?name="+name; 
					 },
					 error:function(){
						 
					 }
				 })
			
				
			}
		}
		
		//全部选择
			$("#selectall").click( 
					
		        function(){ 
		        if(this.checked){ 
		        $("input[name='del']").each(function(){this.checked=true;}); 
		        }else{ 
		        $("input[name='del']").each(function(){this.checked=false;}); 
		        } 
		     })	
			
			 //修改和新增正则
			 $(function(){
			    $("input").change(function(){
				            //获取发生更改的input框的id
							var id=$(this).attr("id");
							var myDiv=$(this).parent().parent().children("div.col-md-4");
							 myDiv2=$(this).parent().parent()
							if(id=="addname"||id=="updatename"){
								var a=$(this).val();
									var regex=/^[\u4e00-\u9fa5|0-9|a-z|A-Z]{0,9}$/
								if(regex.test(a)==true){
									myDiv.html('<p class="icon-check" style="color:green">格式正确</p>')
									s();
								 	}else{
									myDiv.html('<p class="icon-exclamation" style="color:red"><span>请输入十位以内的字母，数字，汉字</span></p>')
							 	    e();
								}
							}
							 if(id=="addurl"||id=="updateurl"){
								 var a=$(this).val();
									var regex=/^[/][0-9|a-z|A-Z|/|?]+(?<![/])$/
								if(regex.test(a)==true){
									myDiv.html('<p class="icon-check" style="color:green" >格式正确</p>')
									s();
								 	}else{
									myDiv.html('<p class="icon-exclamation" style="color:red"><span>必须以/开头，只能包含字母，数字，/和?，不能以/结尾</span></p>')
							 	    e();
								}
								 
							 }
							 if(id=="addpercode"||id=="updatepercode"){
								 var a=$(this).val();
									var regex=/^[\u4e00-\u9fa5|0-9|a-z|A-Z]{0,9}$/
								if(regex.test(a)==true){
									myDiv.html('<p class="icon-check" style="color:green">格式正确</p>')
									s();
								 	}else{
									myDiv.html('<p class="icon-exclamation" style="color:red"><span>请输入十位以内的字母，数字，汉字</span></p>')
							 	    e();
								}
								 
							 }
			            })
			      
			            function s(){
			    	        $('#addbuton').attr("disabled",false)
			    	        $('#updatebutton').attr("disabled",false)
						}
						function e(){
							$('#addbuton').attr("disabled",true)
							$('#updatebutton').attr("disabled",true)
						}

			      })
	<%-- 	function changesearch() {

		}
		
		function updatecustomer(){
			var emId=$("#emIdup").val();
			var customername=$("#customernameup").val();
			var password=$("#passwordup").val();
			var birth=$("#birthdayup").val();
			var name=$("#nameup").val();
			var sex =$("#sexup").val();
			var tel	=$("#telup").val();
			var	address=$("#addressup").val();
			var education=$("#educationup").val();
			var	positionId=$("#positonIdup").val();
			var salary=	$("#salaryup").val();
			$.ajax({
				url:"<%=basePath%>customerController/manager/update",
				type: "post",
				data : {
					emId:emId,
					customername:customername,
					password:password,
					name:name,
					birth:birth,
					sex:sex,
					tel:tel,
					address:address,
					education:education,
					positionId:positionId,
					salary:salary
				},
				success : function(data) {
					var flag=JSON.parse(data)
					if(flag){
						window.location.href="<%=basePath%>customerController/manager/list"
							} else {
								alert("修改失败！！！");
							}
						},
						error : function() {
							alert("修改请求失败");
						}

					})
		
		} --%>
<%-- 		function showcustomer(obj){
			var emId=$(obj).attr('id');
			$.ajax({
				url:"<%=basePath%>customerController/manager/selectcustomer",
				type: "post",
				data : {emId:emId
				},
				success : function(data) 
				{
					var customer=eval(data);
					$("#emIdup").val(customer.emId);
					$("#customernameup").val(customer.customername);
					$("#passwordup").val(customer.password);
					var birthday=getMyDate(customer.birthday);
					$("#birthdayup").val(birthday);
					$("#nameup").val(customer.name);
					$("#sexup").val(customer.sex);
					$("#telup").val(customer.tel);
					$("#addressup").val(customer.address);
					$("#educationup").val(customer.education);
					$("#positonIdup").val(customer.positionId);
					$("#salaryup").val(customer.salary);
					$.ajax({
						url:"<%=basePath%>positionController/manager/selectAllPositions",
						type: "post",
						success : function(data) 
						{
							var positions=eval(data);
							var option="";
							for (var i = 0; i < positions.length; i++) {
								if(positions[i].positionId==customer.positionId){
								option+="<option value='"+positions[i].positionId+"'selected='selected'>"+positions[i].positionName+"</option>";
									
								}else{
								option+="<option value='"+positions[i].positionId+"'>"+positions[i].positionName+"</option>";
									
								}
							}$("#distributePosition").empty();
							$("#distributePosition").append(option);
						}
					})
				}
			})
		} --%>
		
	/* 	function getMyDate(str) {
		    var oDate = new Date(str),
		    oYear = oDate.getFullYear(),
		    oMonth = oDate.getMonth()+1,
		    oDay = oDate.getDate(),
		    oHour = oDate.getHours(),
		    oMin = oDate.getMinutes(),
		    oSen = oDate.getSeconds(),
		    oTime = oYear +"年"+ addZero(oMonth)+"月";
		    return oTime;
		}
		function addZero(num){
		    if(parseInt(num) < 10){
		        num = '0'+num;
		    }
		    return num;
		} */
		//添加用户的函数
	<%-- 	function addPermission(){
			var customername=$("#customername").val();
			var password=$("#password").val();
			var name=$("#name").val();
			$.ajax({
				url:"<%=basePath%>customerController/manager/add",
				type: "post",
				data : {customername:customername,password:password,name:name
				},
				success : function(data) {
					var flag=JSON.parse(data)
					if(flag){
						window.location.href="<%=basePath%>customerController/manager/list"
							} else {
								alert("保存失败！！！");
							}
						},
						error : function() {
							alert("新增请求失败");
						}

					})
		} --%>

		//单个删除
		<%-- function del(obj) {
			var emId=$(obj).prev().attr('id');
			if (confirm("您确定要删除吗?")) {
				$.ajax({
					url:"<%=basePath%>
		customerController/manager/dele",
					type : "post",
					data : {
						emId : emId
					},
					success : function(data) {
						var flag = JSON.parse(data)
						if (flag) {
							$("#" + emId).parent().parent().remove();
						} else {
							alert("删除失败！！！");
						}
					},
					error : function() {
						alert("删除请求失败");
					}

				})
			}
		} --%>

		//全选
		$("#checkall").click(function() {
			$("input[name='id[]']").each(function() {
				if (this.checked) {
					this.checked = false;
				} else {
					this.checked = true;
				}
			});
		})

		//批量删除
		function DelSelect() {
			var Checkbox = false;
			$("input[name='id[]']").each(function() {
				if (this.checked == true) {
					Checkbox = true;
				}
			});
			if (Checkbox) {
				var t = confirm("您确认要删除选中的内容吗？");
				if (t == false)
					return false;
				$("#listform").submit();
			} else {
				alert("请选择您要删除的内容!");
				return false;
			}
		}

		//批量排序
		function sorts() {
			var Checkbox = false;
			$("input[name='id[]']").each(function() {
				if (this.checked == true) {
					Checkbox = true;
				}
			});
			if (Checkbox) {

				$("#listform").submit();
			} else {
				alert("请选择要操作的内容!");
				return false;
			}
		}

		//批量首页显示
		function changeishome(o) {
			var Checkbox = false;
			$("input[name='id[]']").each(function() {
				if (this.checked == true) {
					Checkbox = true;
				}
			});
			if (Checkbox) {

				$("#listform").submit();
			} else {
				alert("请选择要操作的内容!");

				return false;
			}
		}

		//批量推荐
		function changeisvouch(o) {
			var Checkbox = false;
			$("input[name='id[]']").each(function() {
				if (this.checked == true) {
					Checkbox = true;
				}
			});
			if (Checkbox) {

				$("#listform").submit();
			} else {
				alert("请选择要操作的内容!");

				return false;
			}
		}

		//批量置顶
		function changeistop(o) {
			var Checkbox = false;
			$("input[name='id[]']").each(function() {
				if (this.checked == true) {
					Checkbox = true;
				}
			});
			if (Checkbox) {

				$("#listform").submit();
			} else {
				alert("请选择要操作的内容!");

				return false;
			}
		}

		//批量移动
		function changecate(o) {
			var Checkbox = false;
			$("input[name='id[]']").each(function() {
				if (this.checked == true) {
					Checkbox = true;
				}
			});
			if (Checkbox) {

				$("#listform").submit();
			} else {
				alert("请选择要操作的内容!");

				return false;
			}
		}

		//批量复制
		function changecopy(o) {
			var Checkbox = false;
			$("input[name='id[]']").each(function() {
				if (this.checked == true) {
					Checkbox = true;
				}
			});
			if (Checkbox) {
				var i = 0;
				$("input[name='id[]']").each(function() {
					if (this.checked == true) {
						i++;
					}
				});
				if (i > 1) {
					alert("只能选择一条信息!");
					$(o).find("option:first").prop("selected", "selected");
				} else {

					$("#listform").submit();
				}
			} else {
				alert("请选择要复制的内容!");
				$(o).find("option:first").prop("selected", "selected");
				return false;
			}
		}
	</script>
</body>
</html>