<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GBK" />
<title>联动下拉框</title>
<script type="text/javascript" src="js/jquery-1.6.js"></script>
<script type="text/javascript">
	function change() {
		var id = $("#select1").val();
		var url = "ajaxRequest.action";
		var params = {
			'id' : id
		};
		$.post(url, params, callback);
	}
	function callback(result, textStatus) {
		if (textStatus == 'success') {
			if (result != null) {
				var select2 = $("#select2");
				select2.empty();
				var tmp = result.split(":");
				select2.append("<option value = '"+tmp[0]+"'>" + tmp[1]
						+ "</option>");
			}
		}
	}
</script>
</head>
<body>
 <c:if test="${paca==paca}">
 hhahha
 </c:if>
	<% 
	if(22==22){
	%>
<input type="button" value="nihao">
	<% 
	}
	%>
	下拉框1：
	<s:select id="select1" list="#{1:'first',2:'second'}"
		onchange="change();" headerKey="-1" headerValue="--no select--" />
	下拉框2：
	<s:select id="select2" list="#{1:'--no select--'}" />
</body>
</html>
