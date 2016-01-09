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
<script src="style/js/Calendar5.js" type="text/javascript"></script>
<title>无标题文档</title>
<script src="style/js/jquery-1.8.3.min.js" type="text/javascript"></script>
<script type="text/javascript">
	function Check() {
		var  time=$("#time").attr("value");
		var  fileUpload=$("#fileUpload").attr("value");
		var leth= $("#message").val().length;
		if(leth>200){
		alert("超出"+(leth-200)+"个字符");
		return false;
		}
		
		if(fileUpload== "" && leth==0) {
			if(confirm("确定不提交文档或者计划内容?")){
			}
		}
	 	if(time== "") {
		alert("时间不能为空！"); 
			return false;
		}
		return true;
	}
</script>
<script type="text/javascript">
        var c = new Calendar("c");
        document.write(c);
</script>


 <script type="text/javascript">
var a = [];
function validate1() {
var userame = $("#time").val();
var bJson =JSON.stringify(a); 	
$.ajax({
		type : "POST", // http请求方式
		url : "sengJson.action",// 发送给服务器的url
		data : {
			"bJson":bJson
		}, // 发送给服务器的参数
		success : function() {
		}
	});
}
</script> 

<SCRIPT LANGUAGE="JavaScript">    
  
</SCRIPT> 

 <script type="text/javascript">
	$(document).ready(function() {
	$("#numSelect").val(${url.num});
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
					//parent.location.reload();
					$("#tdtime").empty();
					var tdStr="";
					for(var i=0;i<num;i++){
						tdStr+="<tr><td class='timeN'>截止时间"+(i+1)+"：</td><td><input type='text' name='urlList.endtime' class='timeN' id='time' onfocus='c.showMoreDay = false;c.show(this);' /></td></tr>";
					}
					$("#tdtime").append($(tdStr));
				}
			});
		});
	});
</script> 
</head>

<body style=" margin:0 auto;  width:450px">
	<center>
		<font size="6">提交计划</font>
		<s:form action="addHandPlan.action" method="post"
			enctype="multipart/form-data" name="form">
			<table width="450" border="2">
			<input type="hidden" value="${gotoid}" name="url.id"/>
			<tr>
			<td>
			计划内容：
			</td>
		<td>
  <textarea name="message" id="message" cols="25" rows="4" ></textarea> 
		</td>
			</tr>
				<tr>
					<td>文件上传：</td>
					<td><s:file name="fileUpload" theme="simple" id="fileUpload" />
					</td>
				</tr>
				<tr>
				<td>
				设置时间点个数：
				</td>
				 <td>
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
				</td> 
				</tr>
				</table> 
				<table id="tdtime" width="450" border="2">
				<%-- <c:forEach begin="1" step="1" end="${url.num}" varStatus="status">
				<tr>
				<td>截止时间${status.index}：</td>
				<td><input type="text" name="urlList.endtime" id="time"
						onfocus="c.showMoreDay = false;c.show(this);" /></td>
				</tr>
				</c:forEach>  --%>
				<tr>
				<td>截止时间1：</td>
				<td><input type="text" name="urlList.endtime" id="time"
						onfocus="c.showMoreDay = false;c.show(this);" /></td>
				</tr>
				</table>
				<table width="450" border="2">
				<tr>
					<td colspan="2"><s:submit value="提交"  onclick="return Check();"  theme="simple" />
					<input type="button" value="返回"
				onclick="javascript:location.href='returnHome.action' " /></td>
				</tr>
				
			</table>
			<tr>

			</tr>
		</s:form>

	</center>
</body>
</html>
