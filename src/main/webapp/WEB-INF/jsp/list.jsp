<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	pageContext.setAttribute("APP_PATH", request.getContextPath());
%>
<!DOCTYPE HTML>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>客户信息管理系统</title>
	<!-- 引入css样式文件 -->
	<!-- Bootstrap Core CSS -->
	<link href="<%=basePath%>css/bootstrap.min.css" rel="stylesheet" />
	<!-- MetisMenu CSS -->
	<link href="<%=basePath%>css/metisMenu.min.css" rel="stylesheet" />
	<!-- DataTables CSS -->
	<link href="<%=basePath%>css/dataTables.bootstrap.css" rel="stylesheet" />
	<!-- Custom CSS -->
	<link href="<%=basePath%>css/sb-admin-2.css" rel="stylesheet" />
	<!-- Custom Fonts -->
	<link href="<%=basePath%>css/font-awesome.min.css" rel="stylesheet"
		  type="text/css" />
	<link href="<%=basePath%>css/boot-crm.css" rel="stylesheet"
		  type="text/css" />
</head>
<body>
<div id="wrapper">
	<!-- 导航栏部分 -->
	<nav class="navbar navbar-default navbar-static-top" role="navigation"
		 style="margin-bottom: 0">
		<div class="navbar-header">
			<a class="navbar-brand" href="<%=basePath%>list">鑫鑫客户管理系统 v1.0</a>
		</div>
		<!-- 导航栏右侧图标部分 -->
		<ul class="nav navbar-top-links navbar-right">
			<!-- 邮件通知 start -->
			<li class="dropdown"><a class="dropdown-toggle"
									data-toggle="dropdown" href="#"> <i
					class="fa fa-envelope fa-fw"></i> <i class="fa fa-caret-down"></i>
			</a>
				<ul class="dropdown-menu dropdown-messages">
					<li><a href="#">
						<div>
							<strong>张经理</strong> <span class="pull-right text-muted">
										<em>昨天</em>
									</span>
						</div>
						<div>今天晚上开会，讨论一下下个月工作的事...</div>
					</a></li>
					<li class="divider"></li>
					<li><a class="text-center" href="#"> <strong>查看全部消息</strong>
						<i class="fa fa-angle-right"></i>
					</a></li>
				</ul></li>
			<!-- 邮件通知 end -->
			<!-- 任务通知 start -->
			<li class="dropdown"><a class="dropdown-toggle"
									data-toggle="dropdown" href="#"> <i class="fa fa-tasks fa-fw"></i>
				<i class="fa fa-caret-down"></i>
			</a>
				<ul class="dropdown-menu dropdown-tasks">
					<li><a href="#">
						<div>
							<p>
								<strong>任务 1</strong> <span class="pull-right text-muted">完成40%</span>
							</p>
							<div class="progress progress-striped active">
								<div class="progress-bar progress-bar-success"
									 role="progressbar" aria-valuenow="40" aria-valuemin="0"
									 aria-valuemax="100" style="width: 40%">
									<span class="sr-only">完成40%</span>
								</div>
							</div>
						</div>
					</a></li>
					<li class="divider"></li>
					<li><a href="#">
						<div>
							<p>
								<strong>任务 2</strong> <span class="pull-right text-muted">完成20%</span>
							</p>
							<div class="progress progress-striped active">
								<div class="progress-bar progress-bar-info" role="progressbar"
									 aria-valuenow="20" aria-valuemin="0" aria-valuemax="100"
									 style="width: 20%">
									<span class="sr-only">完成20%</span>
								</div>
							</div>
						</div>
					</a></li>
					<li class="divider"></li>
					<li><a class="text-center" href="#"> <strong>查看所有任务</strong>
						<i class="fa fa-angle-right"></i>
					</a></li>
				</ul></li>
			<!-- 任务通知 end -->
			<!-- 消息通知 start -->
			<li class="dropdown"><a class="dropdown-toggle"
									data-toggle="dropdown" href="#"> <i class="fa fa-bell fa-fw"></i>
				<i class="fa fa-caret-down"></i>
			</a>
				<ul class="dropdown-menu dropdown-alerts">
					<li><a href="#">
						<div>
							<i class="fa fa-comment fa-fw"></i> 新回复 <span
								class="pull-right text-muted small">4分钟之前</span>
						</div>
					</a></li>
					<li class="divider"></li>
					<li><a href="#">
						<div>
							<i class="fa fa-envelope fa-fw"></i> 新消息 <span
								class="pull-right text-muted small">4分钟之前</span>
						</div>
					</a></li>
					<li class="divider"></li>
					<li><a href="#">
						<div>
							<i class="fa fa-tasks fa-fw"></i> 新任务 <span
								class="pull-right text-muted small">4分钟之前</span>
						</div>
					</a></li>
					<li class="divider"></li>
					<li><a href="#">
						<div>
							<i class="fa fa-upload fa-fw"></i> 服务器重启 <span
								class="pull-right text-muted small">4分钟之前</span>
						</div>
					</a></li>
					<li class="divider"></li>
					<li><a class="text-center" href="#"> <strong>查看所有提醒</strong>
						<i class="fa fa-angle-right"></i>
					</a></li>
				</ul></li>
			<!-- 消息通知 end -->
			<!-- 用户信息和系统设置 start -->
			<li class="dropdown"><a class="dropdown-toggle"
									data-toggle="dropdown" href="#"> <i class="fa fa-user fa-fw"></i>
				<i class="fa fa-caret-down"></i>
			</a>
				<ul class="dropdown-menu dropdown-user">
					<li><a href="#"><i class="fa fa-user fa-fw"></i>
						用户：${USER_SESSION.userCode} </a></li>
					<li><a href="#"><i class="fa fa-gear fa-fw"></i> 系统设置</a></li>
					<li class="divider"></li>
					<li><a
							href="${pageContext.request.contextPath }/logout.action"> <i
							class="fa fa-sign-out fa-fw"></i>退出登录
					</a></li>
				</ul></li>
			<!-- 用户信息和系统设置结束 -->
		</ul>
		<!-- 左侧显示列表部分 start-->
		<div class="navbar-default sidebar" role="navigation">
			<div class="sidebar-nav navbar-collapse">
				<ul class="nav" id="side-menu">

					<li class="sidebar-search">
						<div class="input-group custom-search-form">
							<input type="text" class="form-control" placeholder="查询内容...">
							<span class="input-group-btn">
									<button class="btn btn-default" type="button">
										<i class="fa fa-search" style="padding: 3px 0 3px 0;"></i>
									</button>
								</span>
						</div>
					</li>
					<li><a href="${pageContext.request.contextPath }/list"
						   class="active"> <i class="fa fa-edit fa-fw"></i> 客户管理
					</a></li>
					<!-- <li><a href="#"> <i class="fa fa-dashboard fa-fw"></i>
                            客户拜访
                    </a></li> -->
				</ul>
			</div>
		</div>
		<!-- 左侧显示列表部分 end-->
	</nav>
	<!-- 客户列表查询部分  start-->
	<div id="page-wrapper">
		<div class="row">
			<div class="col-lg-12">
				<h1 class="page-header">客户管理</h1>
			</div>
			<!-- /.col-lg-12 -->
		</div>
		<!-- /.row -->
		<div class="panel panel-default">
			<div class="panel-body">
				<form class="form-inline" method="get" accept-charset="UTF-8" action="${pageContext.request.contextPath }/customer/conditionalQuery.action">
					<div class="form-group">
						<label for="customerName">客户名称</label> <input type="text"
																	  class="form-control" id="customerName" name="custName" />
					</div>
					<div class="form-group">
						<label for="customerFrom">客户来源</label> <select
							class="form-control" id="customerFrom" name="custSource">
					</select>
					</div>
					<div class="form-group">
						<label for="custIndustry">所属行业</label> <select
							class="form-control" id="custIndustry" name="custIndustry">
					</select>
					</div>
					<div class="form-group">
						<label for="custLevel">客户级别</label> <select class="form-control"
																	id="custLevel" name="custLevel">
					</select>
					</div>
					<button type="submit" class="btn btn-primary">查询</button>
				</form>
			</div>
		</div>
		<div class="row">
			<div class="col-md-4 col-md-offset-10">
				<button class="btn btn-primary" id="cust_add_modal_btn">新增</button>
				<button class="btn btn-danger" id="cust_delete_all_btn"
						data-toggle="modal" data-target="#newCustomerDialog"
						onclick="clearCustomer()">删除</button>
			</div>
		</div>
		<div class="row">
			<div class="col-lg-12">
				<div class="panel panel-default">
					<div class="panel-heading">客户信息列表</div>
					<!-- /.panel-heading -->
					<table class="table table-bordered table-striped"
						   id="customers_table">
						<thead>
						<tr>
							<th><input type="checkbox" id="check_all" /></th>
							<th>编号</th>
							<th>客户名称</th>
							<th>客户来源</th>
							<th>客户所属行业</th>
							<th>客户级别</th>
							<th>固定电话</th>
							<th>手机</th>
							<th>地址</th>
							<th>操作</th>
						</tr>
						</thead>
						<tbody></tbody>
					</table>

					<!-- 显示分页信息 -->
					<div class="row">
						<!--分页文字信息  -->
						<div class="col-md-6" id="page_info_area"></div>
						<!-- 分页条信息 -->
						<div class="col-md-6" id="page_nav_area"></div>
					</div>

					<!-- /.panel-body -->
				</div>
				<!-- /.panel -->
			</div>
			<!-- /.col-lg-12 -->
		</div>
	</div>
	<!-- 客户列表查询部分  end-->
</div>
<!-- 创建客户模态框 -->
<div class="modal fade" id="newCustomerDialog" tabindex="-1"
	 role="dialog" aria-labelledby="myModalLabel">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<h4 class="modal-title" id="myModalLabel">新建客户信息</h4>
			</div>
			<div class="modal-body">
				<form class="form-horizontal" id="new_customer_form">
					<div class="form-group">
						<label for="new_customerName" class="col-sm-2 control-label">
							客户名称 </label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="new_customerName"
								   placeholder="客户名称" name="custName" />
						</div>
					</div>
					<div class="form-group">
						<label for="new_customerFrom"
							   style="float: left; padding: 7px 15px 0 27px;">客户来源</label>
						<div class="col-sm-10">
							<select class="form-control" id="new_customerFrom"
									name="custSource">
							</select>
						</div>
					</div>
					<div class="form-group">
						<label for="new_custIndustry"
							   style="float: left; padding: 7px 15px 0 27px;">所属行业</label>
						<div class="col-sm-10">
							<select class="form-control" id="new_custIndustry"
									name="custIndustry">
							</select>
						</div>
					</div>
					<div class="form-group">
						<label for="new_custLevel"
							   style="float: left; padding: 7px 15px 0 27px;">客户级别</label>
						<div class="col-sm-10">
							<select class="form-control" id="new_custLevel"
									name="custLevel">
							</select>
						</div>
					</div>
					<div class="form-group">
						<label for="new_linkMan" class="col-sm-2 control-label">联系人</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="new_linkMan"
								   placeholder="联系人" name="custLinkman" />
						</div>
					</div>
					<div class="form-group">
						<label for="new_phone" class="col-sm-2 control-label">固定电话</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="new_phone"
								   placeholder="固定电话" name="custPhone" />
						</div>
					</div>
					<div class="form-group">
						<label for="new_mobile" class="col-sm-2 control-label">移动电话</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="new_mobile"
								   placeholder="移动电话" name="custMobile" />
							<span class="help-block"></span>
						</div>
					</div>
					<div class="form-group">
						<label for="new_zipcode" class="col-sm-2 control-label">邮政编码</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="new_zipcode"
								   placeholder="邮政编码" name="custZipcode" />
							<span class="help-block"></span>
						</div>
					</div>
					<div class="form-group">
						<label for="new_address" class="col-sm-2 control-label">联系地址</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="new_address"
								   placeholder="联系地址" name="custAddress" />
						</div>
					</div>
				</form>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
				<button type="button" class="btn btn-primary" id="cust_create_btn" >创建客户</button>
			</div>
		</div>
	</div>
</div>
<!-- 修改客户模态框 -->
<div class="modal fade" id="customerEditDialog" tabindex="-1"
	 role="dialog" aria-labelledby="myModalLabel">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<h4 class="modal-title" id="myModalLabel">修改客户信息</h4>
			</div>
			<div class="modal-body">
				<form class="form-horizontal" id="edit_customer_form">
					<input type="hidden" id="edit_cust_id" name="custId" />
					<div class="form-group">
						<label for="edit_customerName" class="col-sm-2 control-label">客户名称</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="edit_customerName"
								   placeholder="客户名称" name="custName" />
						</div>
					</div>
					<div class="form-group">
						<label for="edit_customerFrom"
							   style="float: left; padding: 7px 15px 0 27px;">客户来源</label>
						<div class="col-sm-10">
							<select class="form-control" id="edit_customerFrom"
									name="custSource">
							</select>
						</div>
					</div>
					<div class="form-group">
						<label for="edit_custIndustry"
							   style="float: left; padding: 7px 15px 0 27px;">所属行业</label>
						<div class="col-sm-10">
							<select class="form-control" id="edit_custIndustry"
									name="custIndustry">
							</select>
						</div>
					</div>
					<div class="form-group">
						<label for="edit_custLevel"
							   style="float: left; padding: 7px 15px 0 27px;">客户级别</label>
						<div class="col-sm-10">
							<select class="form-control" id="edit_custLevel"
									name="custLevel">
							</select>
						</div>
					</div>
					<div class="form-group">
						<label for="edit_linkMan" class="col-sm-2 control-label">联系人</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="edit_linkMan"
								   placeholder="联系人" name="custLinkman" />
						</div>
					</div>
					<div class="form-group">
						<label for="edit_phone" class="col-sm-2 control-label">固定电话</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="edit_phone"
								   placeholder="固定电话" name="custPhone" />
						</div>
					</div>
					<div class="form-group">
						<label for="edit_mobile" class="col-sm-2 control-label">移动电话</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="edit_mobile"
								   placeholder="移动电话" name="custMobile" />
							<span class="help-block"></span>
						</div>
					</div>
					<div class="form-group">
						<label for="edit_zipcode" class="col-sm-2 control-label">邮政编码</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="edit_zipcode"
								   placeholder="邮政编码" name="custZipcode" />
							<span class="help-block"></span>
						</div>
					</div>
					<div class="form-group">
						<label for="edit_address" class="col-sm-2 control-label">联系地址</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="edit_address"
								   placeholder="联系地址" name="custAddress" />
						</div>
					</div>
				</form>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
				<button type="button" class="btn btn-primary" id="cust_update_btn">保存修改</button>
			</div>
		</div>
	</div>
</div>

<!-- 引入js文件 -->
<!-- jQuery -->
<script src="<%=basePath%>js/jquery-1.11.3.min.js"></script>
<!-- Bootstrap Core JavaScript -->
<script src="<%=basePath%>js/bootstrap.min.js"></script>
<!-- Metis Menu Plugin JavaScript -->
<script src="<%=basePath%>js/metisMenu.min.js"></script>
<!-- DataTables JavaScript -->
<script src="<%=basePath%>js/jquery.dataTables.min.js"></script>
<script src="<%=basePath%>js/dataTables.bootstrap.min.js"></script>
<script src="<%=basePath%>js/sb-admin-2.js"></script>


<!-- 编写js代码 -->
<script type="text/javascript">
	var totalRecord, currentPage;
	// 1、页面加载完成以后，直接去发送ajax请求,要到分页数据
	$(function() {
		// 判断请求参数中是否有页数信息
		var pn = ${pn};
		if(pn==null){
			// 去首页
			to_page(1);
		}
		// 去pn页
		to_page(pn);
	});

	function to_page(pn) {
		$.ajax({
			url : "${APP_PATH}/customers",
			data : "pn=" + pn,
			type : "GET",
			success : function(result) {
				// 0、清空checkboxs选中信息..为啥不行？
				$(".check_all").attr("checked", false);
				$(".check_all").prop("checked", false);
				// 1、解析并显示客户数据
				build_customers_table(result);
				// 2、解析并显示分页信息
				build_page_info(result);
				// 3、解析显示分页条数据
				build_page_nav(result);
				// 4、解析查询下拉菜单数据
				build_query_option_index(result);
			}
		});
	}

	function build_customers_table(result) {
		// 清空table表格
		$("#customers_table tbody").empty();
		var customers = result.msgMap.pageInfo.list;
		$
				.each(
						customers,
						function(index, item) {
							var checkBoxTd = $("<td><input type='checkbox' class='check_item'/></td>").attr("align", "center");
							var custIdTd = $("<td></td>").append((item.custId==null||item.custId=='')?"无":item.custId).attr("align", "center");
							var custNameTd = $("<td></td>").append((item.custName==null||item.custName=='')?"无":item.custName).attr("align", "center");
							var custSourceTd = $("<td></td>").append((item.custSource==null||item.custSource=='')?"无":item.custSource).attr("align", "center");
							var custIndustryTd = $("<td></td>").append((item.custIndustry==null||item.custIndustry=='')?"无":item.custIndustry).attr("align", "center");
							var custLevelTd = $("<td></td>").append((item.custLevel==null||item.custLevel=='')?"无":item.custLevel).attr("align", "center");
							var custPhoneTd = $("<td></td>").append((item.custPhone==null||item.custPhone=='')?"无":item.custPhone).attr("align", "center");
							var custMobileTd = $("<td></td>").append((item.custMobile==null||item.custMobile=='')?"无":item.custMobile).attr("align", "center");
							var custAddressTd = $("<td></td>").append((item.custAddress==null||item.custAddress=='')?"无":item.custAddress).attr("align", "center");
							/**
							 * <button class=""> <span class="" aria-hidden="true"></span>
							 * 编辑 </button>
							 */
							var editBtn = $("<button></button>").addClass(
									"btn btn-primary btn-sm edit_btn").append(
									$("<span></span>").addClass(
											"glyphicon glyphicon-pencil")).append(
									"编辑");
							// 为编辑按钮添加一个自定义的属性，来表示当前客户id
							editBtn.attr("edit-id", item.custId);
							var delBtn = $("<button></button>").addClass(
									"btn btn-danger btn-sm delete_btn").append(
									$("<span></span>").addClass(
											"glyphicon glyphicon-trash")).append(
									"删除");
							// 为删除按钮添加一个自定义的属性来表示当前删除的客户id
							delBtn.attr("del-id", item.custId);
							var btnTd = $("<td></td>").append(editBtn).append(" ")
									.append(delBtn).attr("align", "center");
							$("<tr></tr>").append(checkBoxTd).append(custIdTd)
									.append(custNameTd).append(custSourceTd).append(
									custIndustryTd).append(custLevelTd).append(
									custPhoneTd).append(custMobileTd).append(custAddressTd).append(btnTd)
									.appendTo("#customers_table tbody");
						});
	}
	function build_page_info(result) {
		$("#page_info_area").empty();
		$("#page_info_area").append(
				"当前" + result.msgMap.pageInfo.pageNum + "页,总"
				+ result.msgMap.pageInfo.pages + "页,总"
				+ result.msgMap.pageInfo.total + "条记录");
		totalRecord = result.msgMap.pageInfo.total;
		currentPage = result.msgMap.pageInfo.pageNum;
	}
	// 解析显示分页条，点击分页要能去下一页....
	function build_page_nav(result) {
		// page_nav_area
		$("#page_nav_area").empty();
		var ul = $("<ul></ul>").addClass("pagination");

		// 构建元素
		var firstPageLi = $("<li></li>").append(
				$("<a></a>").append("首页").attr("href", "#"));
		var prePageLi = $("<li></li>").append($("<a></a>").append("&laquo;"));
		if (result.msgMap.pageInfo.hasPreviousPage == false) {
			firstPageLi.addClass("disabled");
			prePageLi.addClass("disabled");
		} else {
			// 为元素添加点击翻页的事件
			firstPageLi.click(function() {
				to_page(1);
			});
			prePageLi.click(function() {
				to_page(result.msgMap.pageInfo.pageNum - 1);
			});
		}

		var nextPageLi = $("<li></li>").append($("<a></a>").append("&raquo;"));
		var lastPageLi = $("<li></li>").append(
				$("<a></a>").append("末页").attr("href", "#"));
		if (result.msgMap.pageInfo.hasNextPage == false) {
			nextPageLi.addClass("disabled");
			lastPageLi.addClass("disabled");
		} else {
			nextPageLi.click(function() {
				to_page(result.msgMap.pageInfo.pageNum + 1);
			});
			lastPageLi.click(function() {
				to_page(result.msgMap.pageInfo.pages);
			});
		}

		// 添加首页和前一页 的提示
		ul.append(firstPageLi).append(prePageLi);
		// 1,2，3遍历给ul中添加页码提示
		$.each(result.msgMap.pageInfo.navigatepageNums, function(index, item) {

			var numLi = $("<li></li>").append($("<a></a>").append(item));
			if (result.msgMap.pageInfo.pageNum == item) {
				numLi.addClass("active");
			}
			numLi.click(function() {
				to_page(item);
			});
			ul.append(numLi);
		});
		// 添加下一页和末页 的提示
		ul.append(nextPageLi).append(lastPageLi);

		// 把ul加入到nav
		var navEle = $("<nav></nav>").append(ul);
		navEle.appendTo("#page_nav_area");
	}
	// 解析查询下拉菜单数据(主页)
	function build_query_option_index(result){
		$("<option></option>").append("").appendTo("#customerFrom");
		$("<option></option>").append("").appendTo("#custIndustry");
		$("<option></option>").append("").appendTo("#custLevel");
		$.each(result.msgMap.fromType, function() {
			$("<option></option>").append(this.dictItemName)
					.attr("value", this.dictId).appendTo("#customerFrom");
		});
		$.each(result.msgMap.industryType, function() {
			$("<option></option>").append(this.dictItemName)
					.attr("value", this.dictId).appendTo("#custIndustry");
		});
		$.each(result.msgMap.levelType, function() {
			$("<option></option>").append(this.dictItemName)
					.attr("value", this.dictId).appendTo("#custLevel");
		});
	}
	// 清空表单样式及内容
	function reset_form(ele) {
		$(ele)[0].reset();
		// 清空表单样式
		/* $(ele).find("*").removeClass("has-error has-success");
		$(ele).find(".help-block").text(""); */
	}
	$("#cust_add_modal_btn").click(function() {
		// 清除表单数据（表单完整重置（表单的数据，表单的样式））
		reset_form("#newCustomerDialog form");
		// s$("")[0].reset();
		// 发送ajax请求，查出分类信息，显示在下拉列表中
		getBaseDict("#new_customerFrom","#new_custIndustry","#new_custLevel");
		// 弹出模态框
		$("#newCustomerDialog").modal({
			backdrop : "static"
		});
	});
	function getBaseDict(ele1,ele2,ele3) {
		// 清空之前下拉列表的值
		$(ele1).empty();
		$(ele2).empty();
		$(ele3).empty();
		$.ajax({
			url : "${APP_PATH}/baseDicts",
			type : "GET",
			success : function(result) {
				$.each(result.msgMap.fromType, function() {
					var optionEle = $("<option></option>").append(this.dictItemName)
							.attr("value", this.dictId);
					optionEle.appendTo(ele1);
				});
				$.each(result.msgMap.industryType, function() {
					var optionEle = $("<option></option>").append(this.dictItemName)
							.attr("value", this.dictId);
					optionEle.appendTo(ele2);
				});
				$.each(result.msgMap.levelType, function() {
					var optionEle = $("<option></option>").append(this.dictItemName)
							.attr("value", this.dictId);
					optionEle.appendTo(ele3);
				});
			}
		});
	}


	// 点击保存，保存员工。
	$("#cust_create_btn").click(
			function() {
				// 1、模态框中填写的表单数据提交给服务器进行保存
				// 1、先对要提交给服务器的数据进行校验
				if (!validate_add_form()) {
					return false;
				};
				// 2、发送ajax请求保存员工
				$.ajax({
					url : "${APP_PATH}/customer",
					type : "POST",
					data : $("#newCustomerDialog form").serialize(),
					success : function(result) {
						if (result.code == 1) {
							// 员工保存成功；
							// 1、关闭模态框
							$("#newCustomerDialog").modal('hide');

							// 2、来到最后一页，显示刚才保存的数据
							// 发送ajax请求显示最后一页数据即可 totalRecord为总记录数
							// 分页查询每页大于等于一个数据 若一页显示一条数据页数最少 totalRecord+1一定大于总页数
							to_page(totalRecord+1);
						} else {
							// 显示失败信息
							// 有哪个字段的错误信息就显示哪个字段的；
							alert("添加失败！");
						}
					}
				});
			});




	// 校验表单数据
	function validate_add_form() {
		// 1、拿到要校验的数据，使用正则表达式
		var custMobile = $("#new_mobile").val();
		var regMobile = /^[1][3,4,5,7,8][0-9]{9}$/;
		if (!regMobile.test(custMobile)) {
			show_validate_msg("#new_mobile", "error", "手机号码格式不正确");
			return false;
		} else {
			show_validate_msg("#new_mobile", "success", "");
		};

		// 2、校验邮政编码信息
		var custZipcode = $("#new_zipcode").val();
		var regZipcode = /^\d{6}$/;
		if (!regZipcode.test(custZipcode)) {
			show_validate_msg("#new_zipcode", "error", "邮政编码格式不正确");
			return false;
		} else {
			show_validate_msg("#new_zipcode", "success", "");
		}
		return true;
	}

	// 1、我们是按钮创建之前就绑定了click，所以绑定不上。
	// ①、可以在创建按钮的时候绑定。
	// ②、绑定点击.live()
	// jquery新版没有live，使用on进行替代

	$(document).on("click", ".edit_btn", function() {
		// 1、发送ajax请求，查出分类信息，显示在下拉列表中
		console.log(2);
		getBaseDict("#edit_customerFrom","#edit_custIndustry","#edit_custLevel");
		// 2、查出客户信息，显示客户信息
		getcust($(this).attr("edit-id"));

		// 3、把客户的id传递给模态框的更新按钮
		$("#cust_update_btn").attr("edit-id", $(this).attr("edit-id"));
		$("#customerEditDialog").modal({
			backdrop : "static"
		});
	});
	function getcust(id) {
		$.ajax({
			url : "${APP_PATH}/customer/" + id,
			type : "GET",
			async: false,
			success : function(result) {
				var custData = result.msgMap.cust;
				$("#edit_customerName").val(custData.custName).attr("readOnly","true");
				$("#edit_linkMan").val(custData.custLinkman);
				$("#edit_phone").val([ custData.custPhone ]);
				$("#edit_mobile").val([ custData.custMobile ]);
				$("#edit_zipcode").val([ custData.custZipcode ]);
				$("#edit_address").val([ custData.custAddress ]);
				//不加alert()不能填充下拉框
				alert("要修改的用户为："+custData.custName);
				$("#edit_customerFrom").val([custData.custSource]);
				$("#edit_custIndustry").val([custData.custIndustry]);
				$("#edit_custLevel").val([custData.custLevel]);
			}
		});
	}

	// 点击更新，更新客户信息
	$("#cust_update_btn").click(function() {
		// 验证邮箱是否合法
		// 1、校验信息

		var mobile = $("#edit_mobile").val();
		var zipcode = $("#edit_zipcode").val();
		/* 1--以1为开头；

		2--第二位可为3,4,5,7,8,中的任意一位；

		3--最后以0-9的9个整数结尾。 */
		var regMobile = /^[1][3,4,5,7,8][0-9]{9}$/;
		//邮政编码有0开头的
		var regZipcode = /^\d{6}$/;

		if (!regMobile.test(mobile)) {
			show_validate_msg("#edit_mobile", "error", "手机号码格式不正确！");
			return false;
		}
		if (!regZipcode.test(zipcode)) {
			show_validate_msg("#edit_zipcode", "error", "邮政编码格式不正确！");
			return false;
		}
		show_validate_msg("#edit_mobile", "success", "");
		show_validate_msg("#edit_zipcode", "success", "");
		// 2、发送ajax请求保存更新的客户数据
		$.ajax({
			//alert($("#customerEditDialog form").serialize());
			url : "${APP_PATH}/customer/" + $(this).attr("edit-id"),
			type : "PUT",
			data : $("#customerEditDialog form").serialize(),
			success : function(result) {
				// alert(result.msg);
				// 1、关闭对话框
				$("#customerEditDialog").modal("hide");
				// 2、回到本页面
				to_page(currentPage);
			}
		});

	});
	// 显示校验结果的提示信息
	function show_validate_msg(ele, status, msg) {
		// 清除当前元素的校验状态
		$(ele).parent().removeClass("has-success has-error");
		$(ele).next("span").text("");
		if ("success" == status) {
			$(ele).parent().addClass("has-success");
			$(ele).next("span").text(msg);
		} else if ("error" == status) {
			$(ele).parent().addClass("has-error");
			$(ele).next("span").text(msg);
		}
	}

	// 完成全选/全不选功能
	$("#check_all").click(function() {
		// attr获取checked是undefined;
		// 我们这些dom原生的属性；attr获取自定义属性的值；
		// prop修改和读取dom原生属性的值
		$(".check_item").prop("checked", $(this).prop("checked"));
	});
	// check_item
	$(document).on("click", ".check_item", function() {
		// 判断当前选择中的元素是否5个
		var flag = $(".check_item:checked").length == $(".check_item").length;
		$("#check_all").prop("checked", flag);
	});

	//单个删除
	$(document).on("click",".delete_btn",function(){
		//1、弹出是否确认删除对话框
		var custName = $(this).parents("tr").find("td:eq(2)").text();
		var custId = $(this).attr("del-id");
		//alert($(this).parents("tr").find("td:eq(1)").text());
		if(confirm("确认删除【"+custName+"】吗？")){
			//确认，发送ajax请求删除即可
			$.ajax({
				url:"${APP_PATH}/customer/"+custId,
				type:"DELETE",
				success:function(result){
					// if(result.code==1){
					// 	alert(result.msg+"：成功删除"+custName);
					// }else {
					alert(result.msg);
					// }
					//回到本页
					to_page(currentPage);
				}
			});
		}
	});

	//点击全部删除，就批量删除
	$("#cust_delete_all_btn").click(function(){
		var custNames = "";
		var delIdStr = "";
		$.each($(".check_item:checked"),function(){
			//客户名字符串
			custNames += $(this).parents("tr").find("td:eq(2)").text()+",";
			//组装客户id字符串
			delIdStr += $(this).parents("tr").find("td:eq(1)").text()+"-";
		});
		//去除custNames多余的 “,”
		custNames = custNames.substring(0, custNames.length-1);
		//去除删除的id多余的 “-”
		delIdStr = delIdStr.substring(0, delIdStr.length-1);
		//如果未选任何一条记录点击全部删除的按钮 调用substring(0,-1)返回空串
		//传入Controller的是一个长度为0的数组 sql  in(id1,id2)  ()内为空sql会抛异常！
		//所以加入delIdStr非空判断
		if(delIdStr==""){
			alert("请至少选择一条要删除的客户信息！");
			return;
		}
		if(confirm("确认删除【"+custNames+"】吗？")){
			//发送ajax请求删除
			$.ajax({
				url:"${APP_PATH}/customer/"+delIdStr,
				type:"DELETE",
				success:function(result){
					// if(result.code==1){
					// 	alert(result.msg+"：成功删除"+custNames);
					// }else {
					alert(result.msg);
					// }
					//回到本页
					$("#customerEditDialog").modal('hide');
					to_page(currentPage);
				}
			});
		}
	});
</script>
</body>
</html>

