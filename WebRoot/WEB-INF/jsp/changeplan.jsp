<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<link rel="stylesheet" href="styleNew/css/Style.css" type="text/css">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<script src="style/js/jquery-1.8.3.min.js" type="text/javascript"></script>

<title>无标题文档</title>
<script type="text/javascript">
	function Check() {
	var  selectname=$("#selectname").val();
		if(selectname== ""||selectname==null) {
		alert("执行人不能为空！");
			return false;
		}
		return true;
	}
</script>


<script type="text/javascript">	
function validate() {
	
	var rolename = $("#selectName").find("option:selected").text();
	var depName = $("#selectDeName").find("option:selected").text();
	// 使用jquery的XMLHTTPRequest对象get请求的封装
	$("#selectname").html("");
	$.ajax({
		type : "POST", // http请求方式
		url : "findUserSelect.action",// 发送给服务器的url
		data : {
			"rolename" : rolename,
			"depName" :depName
		}, // 发送给服务器的参数
		dataType : "json", // 告诉JQUERY返回的数据格式(注意此处数据格式一定要与提交的servlet返回的数据格式一致,不然不会调用callback)
		success : function(data) {
			$.each(data, function(index) {
			$(new Option(data[index].realname,data[index].id)).appendTo("#selectname");
			}); 
		}
	});
	
}
</script>
</head>

<body>
<table width="100%" border="0" cellpadding="0" cellspacing="0" class="currentTable"><tr><td>
	<table width="100%" border="0" cellpadding="0" cellspacing="0" class="currentTable">
		<tr class="currentpath">
			<td width="40px"><img src="<%=request.getContextPath()%>/styleNew/images/currentpath_1.gif"></td>
			<td>当前位置：更改执行人</td>
			<td width="10px"><img src="<%=request.getContextPath()%>/styleNew/images/currentpath_2.gif"></td>
		</tr>
	</table>
<s:form action="changeTask" method="post" enctype="multipart/form-data">
<table width="100%" border="0" cellpadding="0" cellspacing="1" class="table_show">
		<tr>
			<td colspan="2" style="padding-left: 0px;">
		 <table width="100%" border="0" cellpadding="1" cellspacing="1" >
         </table>
<table width="100%" border="0" cellpadding="1" cellspacing="1" >
	<tr align="center" class="tr_list_1">
      <td height="28" colspan="2" align="left">
            <table width="100%" border="0" cellpadding="0" cellspacing="3" class="table_show_input">
				<tr>
					<td width="130" height="28" ><strong>目标执行人：</strong></td>
					<td>职称: <s:select name="selectName" list="#listRole"
							listKey="rolename" listValue="rolename" theme="simple"
							id="selectName"  headerValue="请选择"    headerKey=""  onchange=" return validate() ">
						</s:select>
						部门: <s:select name="selectDeName" list="#listDepartments"
							listKey="departName" listValue="departName" theme="simple"
							id="selectDeName" headerValue=""    headerKey="请选择" onchange="return validate() ">
						</s:select>
						 姓名:<select id="selectname" name="user.id" >
					</select></td> 
				</tr>
				
				<tr>
            </table>     
      
      </td>
      </tr>
    <tr bgcolor="#DDDDEC">
      <td height="1" colspan="4"></td>
    </tr>
	</table>

</td>
		</tr>
		<tr>
		  <td align="left" height="25" class="td_page">&nbsp;</td>
			<td align="right" class="td_page">
             <s:submit value="提交" onclick="return Check();" cssClass="button"
							theme="simple" />
            <input type="reset" name="Submit2" class="button" value="返 回" onclick="location.href='javascript:history.go(-1);' "> &nbsp;&nbsp;
             </td>
		</tr>
</table>
</s:form>
</td></tr></table>



<!--
	<center>
		<font size="6">更改执行人</font>
		<s:form action="changeTask" method="post" enctype="multipart/form-data">
			<table width="550" border="2">
				<tr>
					<td>目标执行人：</td>
					<td>职称: <s:select name="selectName" list="#listRole"
							listKey="rolename" listValue="rolename" theme="simple"
							id="selectName"  headerValue="请选择"    headerKey=""  onchange=" return validate() ">
						</s:select>
						部门: <s:select name="selectDeName" list="#listDepartments"
							listKey="departName" listValue="departName" theme="simple"
							id="selectDeName" headerValue=""    headerKey="请选择" onchange="return validate() ">
						</s:select>
						 姓名:<select id="selectname" name="user.id" >
					</select></td>
				</tr>

					<td colspan="2"><s:submit value="提交" onclick="return Check();"
							theme="simple" /> <input type="button" value="返回"
						onclick="javascript:location.href='returnHome.action' " />
					</td>

				</tr>
			</table>
			<tr>

			</tr>
		</s:form>

	</center>-->
</body>
</html>
