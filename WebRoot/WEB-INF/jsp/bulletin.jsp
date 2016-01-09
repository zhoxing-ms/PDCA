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
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>无标题文档</title>
</head>
<script src="style/js/Calendar5.js" type="text/javascript"></script>
<script type="text/javascript">
	function Check() {
		var gonggao = document.getElementById("gonggao").value;
		
		if(gonggao == "" || gonggao.trim() == "") {
		alert("发布信息不能为空！");
			return false;
		}
		
		return true;
	}
</script>
<script type="text/javascript">
        var c = new Calendar("c");
        document.write(c);
</script>
<body>
<table width="100%" border="0" cellpadding="0" cellspacing="0" class="currentTable">
  <tr>
    <td><table width="100%" border="0" cellpadding="0" cellspacing="0" class="currentTable">
      <tr class="currentpath">
        <td width="40px"><img src="<%=request.getContextPath()%>/styleNew/images/currentpath_1.gif" /></td>
        <td>当前位置：发布公告</td>
        <td width="10px"><img src="<%=request.getContextPath()%>/styleNew/images/currentpath_2.gif" /></td>
      </tr>
    </table>
    
<table width="100%" border="0" cellpadding="0" cellspacing="1" class="table_show">
		<form method="post" action="addBulletin.action">
		<tr>
			<td colspan="2" style="padding-left: 0px;">
		 <table width="100%" border="0" cellpadding="1" cellspacing="1" >
         </table>
<table width="100%" border="0" cellpadding="1" cellspacing="1" >
	<tr align="center" class="tr_list_1">
      <td height="28" colspan="2" align="left">
<table width="100%" border="0" cellpadding="0" cellspacing="3">
        <tr>
          <td height="32"> 公 告 内 容：
                <textarea name="bulletin.content" id="gonggao" cols="45" rows="8" style="width:100%"></textarea>
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
            <input type="submit" class="button" value="提 交" name="Submit" onclick="return Check();"/>
        <input type="reset" name="Submit2" class="button" value="返 回" onclick="location.href='javascript:history.go(-1);' " /> &nbsp;&nbsp;
             </td>
		</tr>
</form>
</table>


    
</td>
</tr>
</table>
<!--	<center>
		<font size="6">发布公告</font>
		<form method="post" action="addBulletin.action">
			<table border="2" width="400">

				<tr>
					<td>公告信息</td>
					<td><textarea rows="5" cols="27" name="bulletin.content" id="gonggao"></textarea>
					</td>

				</tr>

			</table>
			<input type="submit" value="提交" onclick="return Check();" /> <input type="button" value="返回"
				onclick="javascript:location.href='returnHome.action' " />
		</form>
	</center>
-->					
</body>
</html>
