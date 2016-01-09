<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>添加用户</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

</head>

<body>
	<p>添加用户</p>
	<form>
		<table>
			<tr>
				<td>请输入用户名</td>
				<td><input type="text" name="username" /></td>
			</tr>

			<tr>
				<td>请输入密码</td>
				<td><input type="password" name="password" /></td>
			</tr>

			<tr>
				<td>请输入真实姓名</td>
				<td><input type="text" name="realname" /></td>
			</tr>

			<tr>
				<td>性别</td>
				<td><select><option selected="selected" value="男">男</option>
						<option value="女">女</option></select></td>
			</tr>

			<tr>
				<td>角色</td>
				<td><select><option selected="selected" value="县长">县长</option>
						<option value="局长">局长</option>
						<option value="科长">科长</option></select></td>
			</tr>
		</table>
		<br /> <input type="submit" value="提交" /> <input type="reset"
			value="重置" />
	</form>
</body>
</html>

