<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE html>
<html>
<head>
<base href="<%=basePath%>">

<title>欢迎来到进程管控平台</title>

<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
<meta name="format-detection" content="telephone=no">
<meta name="renderer" content="webkit">
<meta http-equiv="Cache-Control" content="no-siteapp" />
<link rel="stylesheet" href="style/css/amazeui.min.css" />
<link rel="stylesheet" href="styleNew/css/Style.css" type="text/css">

</head>


<body  style="background-color:#025D96">
<table width="100%" height="95%">
			<form method="post" action="login.action" class="am-form">

<tr><td valign="top">
    <table border="0" cellpadding="0" cellspacing="0" class="logintable_1">
    <tr>
    <td>&nbsp;</td>
    </tr>
    </table>
    <table border="0" cellpadding="0" cellspacing="0" class="logintable_2">
    <tr>
    <td align="center">
    	<table width="852" height="161" border="0" cellpadding="0" cellspacing="0">
        <tr>
        <td width="471" height="138">
        <div class="loginTS">
        <div><p style="font-weight: 900; color: red">${msg }</p></div>
        </div>
        </td>
        <td width="321" valign="top">
        <div style="height:38px; width:100%"></div>
        	<div class="logininput">
            	<div class="logininput_1">用户名：</div>
                <div class="logininput_2"><input  name="user.username" id="username" class="input1" title="用户名" value="" maxlength="18"></div>
            </div>

        	<div class="logininput">
            	<div class="logininput_1">密　码：</div>
                <div class="logininput_2"><input  name="user.password" id="password" type="password" class="input1" title="输入您的密码" value="" maxlength="18"></div>
                
            	
            </div>
        	<div class="logininput">
            	<div class="logininput_1"></div>
                <div class="logininput_3">
                <input name="xuansave" id="xuansave" type="checkbox" value="1" style="vertical-align:middle" ><label for="xuansave">记住登录</label>
                &nbsp;&nbsp;
                <img src="styleNew/images/wenhao.gif" style="vertical-align:middle"/> <a href=''>忘记密码</a>
                </div>
            </div>
        	</td>
        </tr>
        </table>
    </td>
    </tr>
    </table>
    <table border="0" cellpadding="0" cellspacing="0" class="logintable_3">
    <tr>
    <td valign="top" align="center">
    	<table width="852" height="161" border="0" cellpadding="0" cellspacing="0">
        <tr>
        <td width="555" height="138">&nbsp;</td>
        <td width="297" valign="top">
        <div style="height:35px; width:100%">
            <input type="submit" value="登　录" class="button1">
            &nbsp;&nbsp;&nbsp;
            <input name="重置" type="reset" class="button1" value="清　空">
        </div></td>
        </tr>
        </table>
    </td>
    </tr>
    </table>
</td></tr>
</form>
</table>
<!--	<div class="am-g">
		<div class="am-u-lg-6 am-u-md-8 am-u-sm-centered">
			<div class="am-md-text-center">用户登入</div>
			<hr>
			<form method="post" action="login.action" class="am-form">
				<label for="username">用户名</label> 
				aa
				<input type="text" name="user.username" id="username" />
				<br> 
				<label for="password">密码:</label> 
				<input type="password" name="user.password" id="password" />
				<br>
				<div class="am-cf">
					<input type="submit" value="登陆"
						class="am-btn am-btn-primary am-btn-sm am-fl" /> <input
						type="reset" value="重置"
						class="am-btn am-btn-default am-btn-sm am-fr" />
				</div>
			</form>
		</div>
	</div>
--></body>
</html>

