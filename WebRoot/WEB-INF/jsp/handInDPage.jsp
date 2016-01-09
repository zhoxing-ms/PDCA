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
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>无标题文档</title>
<script type="text/javascript">
	function Check() {
		var fileUpload = $("#fileUpload").attr("value");
		alert("handInDPage.jsp");
		if (fileUpload == "") {
			alert("请先上传文档");
			return false;
		}
		return true;
	}
</script>
<script src="style/js/jquery-1.8.3.min.js" type="text/javascript"></script>
<script type="text/javascript">
	$(document).ready(function() {
		var num = ${url.num};
		$("#numSelect").val(num);
		$("#numSelect").change(function() {
			num = $("#numSelect").val();
			$.ajax({	
				url : "updateNum.action",
				cache : false,
				type : "POST",
				data : {
					"num" : num
				},
				success : function() {
					parent.location.reload();
				}
			});
		});
	});
</script>
</head>

<body style=" margin:0 auto;  width:450px">
	<center>
		<font size="6">提交执行</font>
		<form name="numForm">
			<table width="450" border="2">
				<tr>
					<td width="130">提交总数量</td>
					<td><input type="hidden" value="${url.num}" /> 
					<c:if test="${c<1 }">
					<select
						name="url.num" id="numSelect">
							<option value="1">1</option>
							<option value="2">2</option>
							<option value="3">3</option>
							<option value="4">4</option>
							<option value="5">5</option>
							<option value="6">6</option>
							<option value="7">7</option>
							<option value="8">8</option>
					</select>
					</c:if>
					<c:if test="${c>0 }">
					${url.num}
					</c:if>
					</td>
				</tr>
				<tr>
				<td>
				已提交有效文档：
				</td>
				<td>
				${c}个
				</td>
				</tr>
				
			</table>
		</form>


		<div id="multiFiles">
			<c:forEach begin="1" step="1" end="${url.num-c }">
				<s:form method="post" action="addHandDo.action"
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
			</c:forEach>
		</div>


		<input type="button" value="返回主界面"
			onclick="javascript:location.href='returnHome.action' " />

	</center>
</body>
</html>
