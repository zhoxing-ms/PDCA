<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fun"%>  

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html xmlns="http://www.w3.org/1999/xhtml">
<link rel="stylesheet" href="styleNew/css/style.css" type="text/css">
<head>
 
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>欢迎进入进程管控系统</title>
</head>

<body style=" margin:0 auto; ">
<table width="100%" height="100%" border="0" cellpadding="0" cellspacing="0">
<tr><td style="height:80px;">
    <iframe src="indexTop.action" width="100%" height="80px" scrolling="No" frameborder="0"></iframe>
</td></tr>
<tr><td>
                        <iframe id="main" style="Z-INDEX: 1; VISIBILITY: inherit; WIDTH: 100%; HEIGHT: 100%" name=main src="indexHome.action" frameborder=0 scrolling=yes> </iframe>
</td></tr>
</table>

</body>
</html>
