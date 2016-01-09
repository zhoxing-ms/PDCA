<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<link rel="stylesheet" href="styleNew/css/Style.css" type="text/css">
<head>
<script src="style/js/jquery-1.8.3.min.js" type="text/javascript"></script>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>无标题文档</title>

<script type="text/javascript">
	$(function() {

		$(".deleteId").on("click", function() {
			var id = $(this).prev("input").val();
			$.ajax({
				url : "deleteUrl.action",
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
			<td>当前位置：下级项目详情</td>
			<td width="10px"><img src="<%=request.getContextPath()%>/styleNew/images/currentpath_2.gif"></td>
		</tr>
	</table>

<table width="100%" border="0" cellpadding="0" cellspacing="1" class="table_show">
		<tr>
			<td colspan="2" style="padding-left: 0px;">
                
<table width="100%" border="0" cellpadding="1" cellspacing="1" >
		 <tr class="list_top_title">		   
          <td colspan="4" align="center">
            <table width="100%" border="0" cellpadding="1" cellspacing="1" >
                     <tr>		   
                      <td width="38" align="center" nowrap><img src="<%=request.getContextPath()%>/styleNew/images/ren2.gif" border="0" /></td>
                      <td width="1253" align="left" nowrap><strong>已安排任务</strong></td>
                     </tr>
            </table>
          </td>
          </tr>
		 <tr style="height:25px; background:#F9F9F9">		   
          <td width="147" align="center">项目信息</td>
          <td width="284" align="center">下属名称</td>
          <td width="218" align="center">下级任务</td>
          <td width="404" align="center">时间轴详情</td>
        </tr>
        <c:choose>
        	<c:when test="${not empty countList }">
       <s:iterator value="countList" var="count">
    <tr class="tr_list_1">
      <td>${count.url.task.project.projectname}</td>
      <td><a href="selectLowerPerform.action?lowerUrlId=${count.url.id}">${count.url.task.userLower.realname}</a></td>
      <td><a href="${pageContext.request.contextPath}/down.do?resourceName=${count.url.docUrl }">${count.url.docUrl }</a></td>
    
    <td>
					<div align="center">
						<a href="selectTime.action?gotoid=${count.url.id}">具体详情${count.url.id}</a>
					</div>
					</td>
 
    </tr>
    </s:iterator>
    
    </c:when>
        	<c:otherwise>
        		<tr>
        			<td align="center">暂无项目信息。</td>
        		</tr>
        	</c:otherwise>
        </c:choose>
        
    <tr bgcolor="#DDDDEC">
      <td height="1" colspan="7"></td>
    </tr>
</table>

          </td></tr></table>
</td></tr></table>

<!--
<div align="center">
<font size="6">下级项目详情</font>
  <table width="1000" border="2">
    
     <tr>
      <td colspan='9'><div align="center">已安排任务</div></td>
    </tr>
 
    <tr>
      <td><div align="center">项目信息</div></td>
      <td><div align="center">下属名称</div></td>
      <td><div align="center">下级任务</div></td>
      <td><div align="center">时间轴详情</div></td>
    </tr>
       <s:iterator value="countList" var="count">
    <tr>
      <td>${count.url.task.project.projectname}</td>
      <td><a href="selectLowerPerform.action?lowerUrlId=${count.url.id}">${count.url.task.userLower.realname}</a></td>
      <td><a href="${pageContext.request.contextPath}/down.do?resourceName=${count.url.docUrl }">${count.url.docUrl }</a></td>
    
    <td>
					<div align="center">
						<a href="selectTime.action?gotoid=${count.url.id}">具体详情${count.url.id}</a>
					</div>
					</td>
 
    </tr>
    </s:iterator>
       <tr>
    <td colspan="9">
    <center>
    <input type="button" value="返回主界面" onclick="javascript:location.href='returnHome.action' " />
    </center>
    </td>
    </tr>
  </table>
  
  
</div>-->

</body>
</html>
