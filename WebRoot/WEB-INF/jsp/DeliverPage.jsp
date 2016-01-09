<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'DeliverPage.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<script type="text/javascript" src="style/js/jquery-1.8.3.min.js"></script>
  <script type="text/javascript" src="style/js/exporting.js"></script>
  </head>
  
  <body>
    <table  border="1">
    <tr style="height:25px; background:#F9F9F9">
    	  <td width="147" align="center">项目名</td>
    	  <td width="147" align="center">项目描述</td>		   
          <td width="147" align="center">项目文件名</td>
          <td width="284" align="center">转交人</td>
          <td width="218" align="center">接受人</td>
          <td width="218" align="center">转交时间</td>
        </tr>
    <tbody>
            <s:iterator value="%{deliverlist}" var ="deliver">
            <tr>
            <td align="center"><b>${deliver.projectId.projectname}</b></td>
            <td align="center"><b>${deliver.projectId.description}</b></td>
            <td align="center"><b>${deliver.content}</b></td>
            <td align="center"><b>${deliver.dispatcher}</b>
            <td align="center"><b>${deliver.receiver}</b>
            <td align="center"><fmt:formatDate value="${deliver.publishTime}" type="date" pattern="yyyy-MM-dd HH:mm:ss"/></td>
         
            </tr>
            </s:iterator>
    </tbody>
    </table>
  </body>
</html>
