<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fun"%>  

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
<title>无标题文档</title>
</head>

<body style=" margin:0 auto; ">
	<table border="0" cellpadding="0" cellspacing="0" class="top_table_bg">
		<tr>
			<td>
				<table border="0" align="right" cellpadding="0" cellspacing="0"
					class="top_table_R">
					<tr>
						<td>
							<table border="0" align="right" cellpadding="0" cellspacing="0"
								class="top_table_L">
								<tr>
									<td>
										<table border="0" align="right" cellpadding="0"
											cellspacing="0" width=100%>
											<tr>
												<td  align="right">&nbsp;</td>
												<td  height="54" align="right" valign="top"></td>
											</tr>
											<tr>
												<td nowrap align="left" style="padding-left: 30px; color: #FFF; font-size: 13px; font-weight: 900; filter: dropshadow(color =#000000, offx =1, offy =1); overflow:hidden">
													个人登入帐号：<b>${user.username}</b>  姓名：<b>${user.realname} 
													</td>
												<td height="26" align="right" valign="bottom">
                                                <input
                                                type="submit" value=" " class="topB1" onClick="parent.main.location.href='indexHome.action'"><input
                                                type="submit" value=" " class="topB2" onClick="parent.main.location.href='rtchangePsd.action'" ><input
                                                type="submit" value=" " class="topB3" onClick="parent.location.href='userExit.action'">
                                                </td>
											</tr>
										</table>


									</td>
								</tr>
							</table>
						</td>
					</tr>
				</table>



			</td>
		</tr>
	</table>
</body>
</html>
