<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>查询结果</title>
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
	<div class="row">
		<div class="col-lg-12">
			<div class="panel panel-default">
				<div class="panel-heading">客户信息列表</div>
				<table class="table table-bordered table-striped">
					<thead>
						<tr>
							<th>编号</th>
							<th>客户名称</th>
							<th>客户来源</th>
							<th>客户所属行业</th>
							<th>客户级别</th>
							<th>固定电话</th>
							<th>手机</th>
							<th>地址</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${customerList}" var="items">
							<tr>
								<td>${items.custId}</td>
								<td>${items.custName}</td>
								<td>${items.custSource}</td>
								<td>${items.custIndustry}</td>
								<td>${items.custLevel}</td>
								<td>${items.custPhone}</td>
								<td>${items.custMobile}</td>
								<td>${items.custAddress}</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</body>
</html>