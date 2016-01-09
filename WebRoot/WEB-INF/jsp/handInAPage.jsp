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
<title>无标题文档</title>
<script type="text/javascript">
	function Check() {
		var fileUpload = $("#fileUpload").attr("value");
		if (fileUpload == "") {
			alert("请先上传文档");
			return false;
		}
		return true;
	}
</script>
<script src="style/js/jquery-1.8.3.min.js" type="text/javascript"></script>
</head>

<body>
<table width="100%" border="0" cellpadding="0" cellspacing="0" class="currentTable"><tr><td>
	<table width="100%" border="0" cellpadding="0" cellspacing="0" class="currentTable">
		<tr class="currentpath">
			<td width="40px"><img src="<%=request.getContextPath()%>/styleNew/images/currentpath_1.gif"></td>
			<td>当前位置：提交反馈</td>
			<td width="10px"><img src="<%=request.getContextPath()%>/styleNew/images/currentpath_2.gif"></td>
		</tr>
	</table>
<s:form method="post" action="addHandA.action"
					enctype="multipart/form-data" class="uploadFiles">
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
					<td width="130" height="28" ><strong>文件上传：</strong></td>
							<td><s:file name="fileUpload" theme="simple" id="fileUpload" />
							</td>
						</tr>
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
             <s:submit value="提交" theme="simple" cssClass="button"
									onclick="return Check();" />
            <input type="reset" name="Submit2" class="button" value="返 回" onclick="location.href='javascript:history.go(-1);' "> &nbsp;&nbsp;
             </td>
		</tr>
</table>
</s:form>
</td></tr></table>


<!--
	<center>
		<font size="6">提交反馈</font>
				<s:form method="post" action="addHandA.action"
					enctype="multipart/form-data" class="uploadFiles">
					<table width="450" border="2">
						<tr>
							<td width="130">文件上传：</td>
							<td><s:file name="fileUpload" theme="simple" id="fileUpload" />
							</td>
							<td width="50"><s:submit value="提交" theme="simple"
									onclick="return Check();" /></td>
						</tr>
					</table>
				</s:form>


		<input type="button" value="返回主界面"
			onclick="javascript:location.href='returnHome.action' " />

	</center>
-->

</body>
</html>
