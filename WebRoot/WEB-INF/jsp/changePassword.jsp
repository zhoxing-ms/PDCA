<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
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
<base href="<%=basePath%>">

<title>密码修改页面</title>

<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
<meta name="format-detection" content="telephone=no">
<meta name="renderer" content="webkit">
<meta http-equiv="Cache-Control" content="no-siteapp" />
<link rel="stylesheet" href="style/css/amazeui.min.css" />
<script type="text/javascript">
function checktxt(){
    var a=document.getElementById("p1").value;
    var b=document.getElementById("p2").value;
    if(a==null || a==""){
 	document.getElementById("passwordDiv").innerText = "密码不能为空！ "; 
    document.getElementById("passwordDiv").style.display="block";
    
   } else {
    document.getElementById("passwordDiv").style.display="none";
  }
}
function checktxt2(){
  var a=document.getElementById("p1").value;
  var b=document.getElementById("p2").value;
  
  if(a!=b){
  	document.getElementById("passwordDiv2").innerText = "两次输入的密码不一致！ "; 
    document.getElementById("passwordDiv2").style.display="block";
  }
  else {
    document.getElementById("passwordDiv2").style.display="none";
  }

}
function checkLoginForm() {
     var a=document.getElementById("p1").value;
  var b=document.getElementById("p2").value;
  
  if(a!=b){
        alert("密码不一致");
        return false;
    }
  }
</script>
</head>


<body>
<table width="100%" border="0" cellpadding="0" cellspacing="0" class="currentTable"><tr><td>
	<table width="100%" border="0" cellpadding="0" cellspacing="0" class="currentTable">
		<tr class="currentpath">
			<td width="40px"><img src="<%=request.getContextPath()%>/styleNew/images/currentpath_1.gif"></td>
			<td>当前位置：密码修改</td>
			<td width="10px"><img src="<%=request.getContextPath()%>/styleNew/images/currentpath_2.gif"></td>
		</tr>
	</table>
<table width="100%" border="0" cellpadding="0" cellspacing="1" class="table_show">
<form method="post" target="_parent" action="changePsd.action" onSubmit="return checkLoginForm()" class="am-form">
		<tr>
			<td colspan="2" style="padding-left: 0px;">
		 <table width="100%" border="0" cellpadding="1" cellspacing="1" >
         </table>
<table width="100%" border="0" cellpadding="1" cellspacing="1" >
	<tr align="center" class="tr_list_1">
      <td height="28" colspan="2" align="left">
            <table width="100%" border="0" cellpadding="0" cellspacing="3" class="table_show_input">
				<tr>
					<td width="130" height="28" ><strong>用户名：</strong></td>
							<td><s:file name="fileUpload" theme="simple" id="fileUpload" />
                            <input type="text" name="username" value="${user.username }" readonly/>
							</td>
				</tr>
				<tr>
					<td><strong>新密码：</strong></td>
							<td><s:file name="fileUpload" theme="simple" id="fileUpload" />
                            <input id="p1" type="password" name="password" onBlur="checktxt()"/> <span id="passwordDiv" style="display:none"></span>
							</td>
				</tr>
				<tr>
					<td><strong>确认新密码：</strong></td>
							<td><s:file name="fileUpload" theme="simple" id="fileUpload" />
                            <input id="p2" type="password" name="repassword" onBlur="checktxt2()" />
				<span id="passwordDiv2" style="display:none"></span>
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
            <input type="submit" value="确定" class="button"/> 
			<input type="button" value="取消" onClick="location.href='javascript:history.go(-1);'" class="button"/>
            &nbsp;&nbsp;
             </td>
		</tr>
</form>
</table>
</td></tr></table>


<!--	<div class="am-g">
	<hr>
		<div class="am-u-lg-6 am-u-md-8 am-u-sm-centered">
			<div class="am-md-text-center">密码修改</div>
			<hr>
			<form method="post" action="changePsd.action" onSubmit="return checkLoginForm()" class="am-form">
				<label for="username">用户名</label> 
				<input type="text" name="username" value="${user.username }" readonly/>
				<br> 
				<label for="password" >新密码</label> 
				<input id="p1" type="password" name="password" onBlur="checktxt()"/> <span id="passwordDiv" style="display:none"></span>
				<br>
				<label for="password">确认新密码</label> 
				<input id="p2" type="password" name="repassword" onBlur="checktxt2()" />
				<span id="passwordDiv2" style="display:none"></span>
				<br>
				<div class="am-cf">
					<input type="submit" value="确定"
						class="am-btn am-btn-primary am-btn-sm am-fl"/> 
					<input
						type="button" value="取消" onClick="location.href='javascript:history.go(-1);'"
						class="am-btn am-btn-default am-btn-sm am-fr" />
				</div>
			</form>
			
		</div>
	</div>-->
</body>
</html>

