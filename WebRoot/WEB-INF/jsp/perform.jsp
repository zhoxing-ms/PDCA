<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>无标题文档</title>
<link href="style/css/style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="style/js/jquery1.10.2.js"></script>
<script type="text/javascript">
$(function(){
	
	//首页大事记
	$('.course_nr2 li').hover(function(){
		$(this).find('.shiji').slideDown(600);
	},function(){
		$(this).find('.shiji').slideUp(400);
	});
	
});
</script>

 <style>
  .graph { 
                      position: relative; 
                      width: 50px; 
                      border: 1px solid #B1D632; 
                      padding: 2px; 
                      margin-bottom: .5em;                    
    }
                  .graph .bar { 
                     display: block;    
                     position: relative;
                     background: #B1D632; 
                     text-align: center; 
                     color: #333; 
                     height: 1em; 
                     line-height: 1em;                                    
                 }
                .graph .bar span { position: absolute; left: 1em; }
</style>
</head>

<body style=" margin:0 auto;  width:700px;margin-top: 30px">
<center>
<font size="6">项目执行</font>
<table border="2" width="700">
<tr>

<div class="clearfix course_nr">
	<ul class="course_nr2">
		<li>
			1993
			<div class="shiji">
				<h1>ddd</h1>
				<p>内容描述1。</p>
			</div>
		</li>
		
	</ul>
</div>

</tr>
<tr>
<td colspan="3">
<center>
<c:if test="${user.role.grade!=1&& sum==0}">
<input type="button" value="提交计划" onclick="window.location.href='handInPage.action'"/>
</c:if>
<input type="button" value="详情" onclick="window.location.href='makeplanPage.action '"/>
<%-- <c:if test="${advance!=('D'.toString())}"> --%>
<input type="button" value="增加执行人" onclick="window.location.href='makeplanPage1.action '"/>
<!-- </c:if> -->
<%-- <c:if test="${user.role.grade!=1&&advance==('D'.toString())}"> --%>
<c:if test="${user.role.grade!=1&& sum!=0}">
<input type="button" value="执行任务" onclick="window.location.href='handInDPage.action'"/>
</c:if>
<c:if test="${user.role.grade!=1}">
<input type="button" value="转交任务" onclick="window.location.href='changeUser.action'"/>
</c:if>
     <input type="button" value="返回主界面" onclick="javascript:location.href='returnHome.action' " />
</center>
</td>
</tr>

</table>

</center>
</body>
</html>
