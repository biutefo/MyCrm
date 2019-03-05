<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html lang="en">
<head>
<title>登录页面</title>
<%
	pageContext.setAttribute("APP_PATH", request.getContextPath());
%>
<script type="text/javascript" src="js/jquery-1.11.3.min.js"></script>
<script type="text/javascript" src="js/vector.js"></script>
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
<meta http-equiv="content-type" content="text/html;charset=utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<title>txt</title>

<link rel="stylesheet" type="text/css" href="css/loginStyle.css">

<script>
	// 判断是登录账号和密码是否为空
	function check() {
		var usercode = $("input[name='usercode']").val();
		var password = $("input[name='password']").val();
		if (usercode == "" || password == "") {
			$("#prompt").text("账号或密码不能为空！（前端检验）");
			return false;
		}
		return true;
	}
</script>

</head>
<body>

	<div id="container">
		<div id="output">
			<div class="containerT">
				<h1>客戶信息管理系統</h1>
				<form class="form" id="entry_form" action="login.action"
					method="post" onsubmit="return check()">
					<input name="usercode" type="text" placeholder="用户名" id="entry_name" value="admin">
					<input name="password" type="password" placeholder="密码" id="entry_password">
					<input type="submit" value="登录">
					<!-- <button type="submit" id="entry_btn">登录</button> -->
					<!-- 用户名或密码为空提示信息 -->
					<div id="prompt" class="prompt">${msg}</div>
				</form>
			</div>
		</div>
	</div>

	<script type="text/javascript">
		$(function() {
			Victor("container", "output"); //登录背景函数
			/* $("#entry_name").focus(); */
			/* $(document).keydown(function(event) {
				if (event.keyCode == 13) {
					$("#entry_btn").click();
				}
			}); */
		});
	</script>
</body>
</html>