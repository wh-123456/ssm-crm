//修改用户模态框准备数据
function update(obj) {
	var id = $(obj).parents("tr").find("#id").text();
	var name = $(obj).parents("tr").find("#name").text();
	var source = $(obj).parents("tr").find("#source").text();
	console.debug(source);
	var industry = $(obj).parents("tr").find("#industry").text();
	var level = $(obj).parents("tr").find("#level").text();
	var phone = $(obj).parents("tr").find("#phone").text();
	var tellPhone = $(obj).parents("tr").find("#tellPhone").text();
	var email = $(obj).parents("tr").find("#email").text();
	var address = $(obj).parents("tr").find("#address").text();
	$("h4").text("修改客户信息");
	$("[name=id]").val(id);
	$("[name=tname]").val(name);
	$("[name=source]").val(source);

	$("[name=industry]").val(industry);
	$("[name=level]").val(level);
	$("[name=phone]").val(phone);
	$("[name=tellPhone]").val(tellPhone);
	$("[name=email]").val(email);
	$("[name=address]").val(address);

}
// 加载客户数据与分页信息
function loadPage(result) {
	var data = result.list;
	var html = ""
	for (var i = 0; i < data.length; i++) {
		html += "<tr><td id='id' width='4%'><input type='checkbox' name='id[]'/>"
				+ data[i].id + "</td>";
		html += "<td id='name' width='6%'>" + data[i].name + "</td>";
		html += "<td id='source' width='8%'>" + data[i].source + "</td>";
		html += "<td id='industry' width='10%'>" + data[i].industry + "</td>";
		html += "<td id='level' width='8%'>" + data[i].level + "</td>";
		html += "<td id='phone' width='8%'>" + data[i].phone + "</td>";
		html += "<td id='tellPhone'>" + data[i].tellPhone + "</td>";
		html += "<td id='email'>" + data[i].email + "</td>";
		html += "<td id='address'>" + data[i].address + "</td>";
		html += "<td ><div><button type='button' id='"
				+ data[i].id
				+ "' class='button border-main border-little icon-plus-square-o' data-toggle='modal' data-target='#addCustomer'onclick='update(this)' >修改</button>";
		html += "<button type='button' class='button border-red button-little' onclick='del(this)'> <span class='icon-trash-o'></span> 删除 </button> </div></td> </tr>";
	}
	$("#customerList").html(html);
	html = "";
	html += "总共"
			+ result.pages
			+ "页，共"
			+ result.total
			+ "条数据。 每页 <select class='form-control' onchange='gotoPage(1,this.value)'";
	for (var j = 4; j < 14; j++) {
		if (j == result.pageSize) {
			html += "<option selected value='" + j + "'>" + j + "</option>";
		} else {
			html += "<option value='" + j + "'>" + j + "</option>";
		}
	}
	/*
	 * html+="<c:forEach var='temp' begin='1' end='10'> <option
	 * "+result.pageSize+"==temp?'selected':''} value='${temp}'>"+temp+"</option>";
	 */
	html += "</select> 条";
	$("#totalPage").html(html);
	var htmlArr = [];
	html = null;
	htmlArr
			.push("<div class='button-group border-blue'><button type='button' class='button button-little'  onclick='gotoPage(1,"
					+ result.pageSize + ")' aria-label='首页'>首页</button>");
	if (!result.isFirstPage) {
		htmlArr
				.push("<button type='button' class='button button-little' onclick='gotoPage("
						+ result.prePage
						+ ","
						+ result.pageSize
						+ ")' aria-label='上一页'>上一页</button>");
	} else {
		htmlArr
				.push("<button type='button' class='button button-little' disabled='disabled' onclick='gotoPage("
						+ result.prePage
						+ ","
						+ result.pageSize
						+ ")' aria-label='上一页'>上一页</button>");

	}
	var start = 1;
	var end = result.pages;
	if (result.pages > 5) {
		start = result.pageNum - 2 > 0 ? result.pageNum - 2 : 1;
		end = end - 2 > result.pageNum ? result.pageNum + 2 : end;
	}
	if (start > 1) {
		htmlArr.push("...");
	}
	for (var k = start; k <= end; k++) {
		if (k == result.pageNum) {
			htmlArr
					.push("<button type='button' class='button button-little active' id='ck' onclick='gotoPage("
							+ k
							+ ","
							+ result.pageSize
							+ ")' aria-label='第"
							+ k + "页'>" + k + "</button>");

		} else {
			htmlArr
					.push("<button type='button' class='button button-little' onclick='gotoPage("
							+ k
							+ ","
							+ result.pageSize
							+ ")' aria-label='第"
							+ k + "页'>" + k + "</button>");
		}
	}
	if (end < result.pages) {
		htmlArr.push("...");
	}
	if (!result.isLastPage) {
		htmlArr
				.push("<button type='button' class='button button-little' onclick='gotoPage("
						+ result.nextPage
						+ ","
						+ result.pageSize
						+ ")' aria-label='下一页'>下一页</button>");
	} else {
		htmlArr
				.push("<button type='button' class='button button-little' disabled='disabled' onclick='gotoPage("
						+ result.nextPage
						+ ","
						+ result.pageSize
						+ ")' aria-label='下一页'>下一页</button>");
	}
	htmlArr
			.push("<button type='button' class='button button-little' onclick='gotoPage("
					+ result.pages
					+ ","
					+ result.pageSize
					+ ")' aria-label='尾页'>尾页</button></div>");
	html = htmlArr.join(" ");
	$(".pagination").html(html);

}
// 删除指定客户
function del(obj) {
	var id = $(obj).prev().attr('id');
	if (confirm("您确定要删除吗?")) {
		$.ajax({
			url : "http://localhost:8080/crm/customer/delete",
			type : "get",
			data : {
				id : id
			},
			success : function(data, status, xhr) {
				// var flag = JSON.parse(data);
				/*
				 * alert(status); if (status=="success") { alert("删除成功！！！"); }
				 * else { alert("删除失败！！！"); }
				 */
			},
			error : function() {
				alert("删除请求失败");
			}

		})
	}
}
// 跳转到指定页面
 function gotoPage(pageNum, pageSize) {
	var source = $("#source").val();
	var industry = $("#industry").val();
	var level = $("#level").val();
	var name = $("[name=searchName]").val();
	$.ajax({
		url : "http://localhost:8080/crm/customer/search",
		type : "get",
		data : {
			source : source,
			industry : industry,
			level : level,
			name : name,
			pageNum : pageNum,
			pageSize : pageSize,
		},
		success : function(result) {
			loadPage(result);
		},
		error : function(result) {
			alert("获取页面数据失败");
		}
	})

 }
//增加/修改客户信息，将信息发送到后台
function pushData() {

	var id = $("[name=id]").val();
	var name = $("[name=tname]").val();
	var source = $("[name=source]").val();
	var industry = $("[name=industry]").val();
	var level = $("[name=level]").val();
	var phone = $("[name=phone]").val();
	var tellPhone = $("[name=tellPhone]").val();
	var email = $("[name=email]").val();
	var address = $("[name=address]").val();
	$.ajax({
		url : "http://localhost:8080/crm/customer/edit",
		type : "get",
		data : {
			id : id,
			name : name,
			source : source,
			industry : industry,
			level : level,
			phone : phone,
			tellPhone : tellPhone,
			email : email,
			address : address
		},
		success : function(data) {
			// alert("ok");
			window.location.href = "http://localhost:8080/crm/customer/list";
		},
		error : function(data) {

		}
	})

}
//将新增的行业/客户来源/客户级别发送到后台
function addSIL() {
	var type = $("[name=addSIL]").val();
	var dictName = $("[name=dictName]").val();
	if (dictName != "") {
		$.ajax({
			url : "http://localhost:8080/crm/customer/addUIL",
			data : {
				type : type,
				dictName : dictName
			},
			success : function(data) {
				refush();
			},
			error : function(data) {
				alert("addSIL失败");
			}
		})
	}
}
//批量删除
function delSelect(){
	var id_arr=[];
	$("input[name='id[]']").each(function() {
		if ($(this).prop("checked")) {
			id_arr.push($(this).parent().text())
		}
	});
	if(id_arr==null){
		return;
	}
	$.ajax({
		url:"http://localhost:8080/crm/customer/deleteMany",
		data:{
			id_arr:id_arr
		},
		traditional:true,
		success:function(data){
			gotoPage();
		},
		error:function(){
			alert("批量删除")
		}
		
	})
}
//刷新页面
function refush(){
	var pageNum = $("#ck").text();
	var pageSize = $(".form-control").val();
	gotoPage(pageNum, pageSize);
}
//全选
function checkAll(obj){
	var flag=$(obj).prop("checked");
	$("input[name='id[]']").each(function() {
		if (flag) {
			this.checked = true;
		} else {
			this.checked = false;
		}
	});
}
//页面加载事件
$(function() {

	// 查询客户
	$("[name=search]").click(function() {
		refush();

	});
    //置空新增客户模态框
	$("[name=add]").bind("click", function() {

		/* $("h4").text("修改客户信息"); */
		$("[name=id]").val("");
		$("[name=tname]").val("");
		$("[name=source]").val("");

		$("[name=industry]").val("");
		$("[name=level]").val("");
		$("[name=phone]").val("");
		$("[name=tellPhone]").val("");
		$("[name=email]").val("");
		$("[name=address]").val("");

	})
	$("#checkAll").bind("click",function(){
		alert("ttt");
	})
	// 反选
	$("#reversCheck").click(function() {
		$("input[name='id[]']").each(function() {
			if (this.checked) {
				this.checked = false;
			} else {
				this.checked = true;
			}
		});
	})
})