<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<link rel="stylesheet" href="styleNew/css/Style.css" type="text/css">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<script src="style/js/jquery-1.8.3.min.js" type="text/javascript"></script>
<title>无标题文档</title>
<script type="text/javascript">
	$(function() {

		$(".deleteId").on("click", function() {
			var id = $(this).prev("input").val();
			$.ajax({
				url : "deleteUrlBy1.action",
				cache : false,
				type : "POST",
				data : {
					"deleteId" : id
				},
			});
			$("#"+id).remove();

		});

	});
</script>
</head>

<body>
<table width="100%" border="0" cellpadding="0" cellspacing="0" class="currentTable"><tr><td>
	<table width="100%" border="0" cellpadding="0" cellspacing="0" class="currentTable">
		<tr class="currentpath">
			<td width="40px"><img src="<%=request.getContextPath()%>/styleNew/images/currentpath_1.gif"></td>
			<td>当前位置：项目信息</td>
			<td width="10px"><img src="<%=request.getContextPath()%>/styleNew/images/currentpath_2.gif"></td>
		</tr>
	</table>

<table width="100%" border="0" cellpadding="0" cellspacing="1" class="table_show">
		<tr>
			<td colspan="2" style="padding-left: 0px;">
            <table border="0" cellpadding="0" cellspacing="0" class="t_list_top_menu" style="width:100%;">
                <tr>
                <td>&nbsp;&nbsp;
                    <%--<a href="entryPage.action"><img src="<%=request.getContextPath()%>/styleNew/images/ruru.gif" border="0" class="opacity" /></a>&nbsp;&nbsp;&nbsp;&nbsp;
                    --%><a href="bulletin.action"><img src="<%=request.getContextPath()%>/styleNew/images/gonggao.gif" border="0" /></a>&nbsp;&nbsp;
                </td>
                <td align="right" >&nbsp;</td>
                </tr>
                </table>
<table width="100%" border="0" cellpadding="1" cellspacing="1" >
		 <tr class="list_top_title">		   
          <td width="30%" align="center">项目名称</td>
          <td width="50%" align="center">项目简介</td>
          <td width="10%" align="center">发布时间</td>
          <%--<c:if test="${user.role.grade==1 }"></c:if>
          --%><td width="10%" align="center">操作</td>
          
        </tr>
	<s:iterator value="projectList" var="project">
	<tr id="${project.id}" align="center" class="tr_list_1">
      <td><a href="selectAllUser.action?spId=${project.id}">${project.projectname}</a></td>
      <td align="center">${project.description}</td>
    <td align="center"><fmt:formatDate value="${project.startTime}" type="date" pattern="yyyy-MM-dd "/></td>
      <td align="center" nowrap="nowrap"><input type="hidden" value="${project.id}"> 
      <input type="button" id="deleteId" value="删除" class="deleteId" /></td>
    </tr>
    </s:iterator>
    <s:iterator value="urlPDCA" var="url">
	<tr align="center" class="tr_list_1">
      <td><a href="selectAllUser.action?spId=${url.task.project.id}">${url.task.project.projectname}</a></td>
      <td align="center">${url.task.project.description}</td>
    <td align="center"> <fmt:formatDate value="${url.task.project.startTime}" type="date" pattern="yyyy-MM-dd "/> </td>
      <td align="center" nowrap="nowrap"></td>
    </tr>
    </s:iterator>
    <tr bgcolor="#DDDDEC">
      <td height="1" colspan="7"></td>
    </tr>
	</table>            </td>
		</tr>
		<tr>
		  <td align="left" height="25" class="td_page">&nbsp;</td>
			<td align="right" class="td_page">&nbsp; </td>
		</tr>
</table>
</td></tr></table>


<!--<div align="center">
<font size="6">项目信息</font>
  <table width="1000" border="2">
    
 
    <tr>
      <td><div align="center">项目名称</div></td>
      <td><div align="center">项目简介</div></td>
      <td><div align="center">发布时间</div></td>
      <c:if test="${user.role.grade==1 }">
      <td><div align="center">操作</div></td>
      </c:if>
    </tr>
     <s:iterator value="projectList" var="project">
    <tr id="${project.id}">
      <td><a href="selectAllUser.action?spId=${project.id}">${project.projectname}</a></td>
      <td>${project.description}</td>
      <td> <fmt:formatDate value="${project.startTime}" type="date" pattern="yyyy-MM-dd "/> </td> 
      <td><input type="hidden" value="${project.id}"> 
      <input type="button" id="deleteId" value="删除" class="deleteId" />
		</td>
    </tr>
    </s:iterator>
     <s:iterator value="urlPDCA" var="url">
    <tr>
      <td><a href="selectAllUser.action?spId=${url.task.project.id}">${url.task.project.projectname}</a></td>
      <td>${url.task.project.description}</td>
      <td> <fmt:formatDate value="${url.task.project.startTime}" type="date" pattern="yyyy-MM-dd "/> </td> 
    </tr>
    </s:iterator>
      <tr>
      <c:if test="${user.role.grade==1 }">
    <td colspan="4">
    </c:if>
    <c:if test="${user.role.grade!=1 }">
    <td colspan="3">
    </c:if>
    <input type="button" value="返回主界面" onclick="javascript:location.href='returnHome.action' " />
    </td>
    </tr>
  </table>
  
  
</div>-->

</body>
</html>
