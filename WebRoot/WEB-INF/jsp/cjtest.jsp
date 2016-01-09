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
<head>
 
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>无标题文档</title>
<script type="text/javascript" src="style/js/jquery-1.8.3.min.js"></script>
  <script type="text/javascript" src="style/js/highcharts.js"></script>
  <script type="text/javascript" src="style/js/exporting.js"></script>
  <script type="text/javascript" src="style/js/highcharts-3d.js"></script>
 <script type="text/javascript">
$(function(){
    var $tree_a = $("#projectSelect").find("a");
    var $main = $("#container");
    $tree_a.on("click", function(){
        $main.empty();//初始化
        var $frame =$("<iframe></iframe>");//定义框架对象
        var $this = $(this);//当前被点击的tree的a
        $frame.attr({//设置中间部分框架的属性
            "src": $this.attr("link"),//框架引入的页面地址
            "name": "main_frame",//框架名称
            "width":  "100%",//框架宽度
            "height":  "300px",//框架高度
            "frameborder": "0",//框架边框
            "scrolling": "auto"//框架滚动条设置
        });
        $frame.appendTo($main);//将框架插入到中间部分
    });
});
 </script>
 <script type="text/javascript">
  function dateToStr(datetime){ 
 var year = datetime.getFullYear();
 var month = datetime.getMonth()+1;//js从0开始取 
 var date = datetime.getDate(); 
 var hour = datetime.getHours(); 
 var minutes = datetime.getMinutes(); 
 var second = datetime.getSeconds();
 
 if(month<10){
  month = "0" + month;
 }
 if(date<10){
  date = "0" + date;
 }
 if(hour <10){
  hour = "0" + hour;
 }
 if(minutes <10){
  minutes = "0" + minutes;
 }
 if(second <10){
  second = "0" + second ;
 }
 var time = year+"-"+month+"-"+date; //2009-06-12 17:18:05
// alert(time);
 return time;
}
   </script>
 
 
  <script type="text/javascript">
 
  $(function(){
 fb(1);
 rw(1);
});
  </script>
  <script type="text/javascript">
  function fb(pageNum){ 
		$("#oo").empty();
		$.ajax({
			type : "POST",
			url : "getInfoOfFB.action",
			 data : {
				"pageNum" : pageNum
			}, 
			dataType : "json",
			success : function(data) {
			var num=0;
			var num1=0;
				var str1 = "";
				str1+="<center>已发布项目列表</center>"
				str1+="<table>"; 
				$.each(data, function(index, val) {
				num=val.p;
				num1=val.d;
				var date = new Date(val.project.startTime);
			str1+="<tr>";
 			str1+="项目名称：<a href='performPage.action?projectId="+val.project.id+"&advance="+val.advance+"' title='点击可查询详细信息'>"+val.project.projectname+"</a>"+"发布时间："+dateToStr(date)+"<br>";		
 			str1+="</tr>";
			str1+="</table>";
				});
			var up=num-1;
			if(up<1){
				up=1;
			}
			var down = num+1;
			var endPage=num1;
			if(down>=endPage){
				down=endPage;
			}
			if(endPage==0){
			}else{
			str1+="<center><a href='javascript:void(0);' onclick='fb("+1+")'>首页</a>";
			str1+="  <a href='javascript:void(0);' onclick='fb("+up+")'>上一页</a>";
			str1+="  <a href='javascript:void(0);' onclick='fb("+down+")'>下一页</a>";
			str1+="  <a href='javascript:void(0);' onclick='fb("+endPage+")'>最后一页</a></center>" ;
			$("#oo").append(str1);
			}
			
			}
		});
  }

</script> 

  <script type="text/javascript">
  function rw(pageNum){ 
  
		$("#bb").empty();
		$.ajax({
			type : "POST",
			url : "getInfoOfRW.action",
			 data : {
				"pageNum" : pageNum
			}, 
			dataType : "json",
			success : function(data) {
			var num=0;
			var num1=0;
				var str1 = "";
				str1+="<center>任务项目列表</center>"
				str1+="<table>"; 
				$.each(data, function(index, val) {
				num=val.p;
				num1=val.d;
				str1+="<tr>";
				str1+="项目名称：<a href='performPage.action?projectId="+val.url.task.project.id+"&urlId="+val.url.id+"&taskId="+val.url.task.id+"'title='点击可查询详细信息'>"+val.url.task.project.projectname+"</a>"+"  "+"上级领导："+val.url.task.userUpper.realname+"  项目任务：<a href='${pageContext.request.contextPath}/down.do?resourceName="+val.url.docUrl+"'>"+val.url.docUrl+"</a>"+"<br>";
 				str1+="</tr>";
				str1+="</table>";
				});
			var up=num-1;
			if(up<1){
				up=1;
			}
			var down = num+1;
			var endPage=num1;
			if(down>=endPage){
				down=endPage;
			}
			if(endPage==0){
			
			}else{
			str1+="<center><a href='javascript:void(0);' onclick='rw("+1+")'>首页</a>";
			str1+="  <a href='javascript:void(0);' onclick='rw("+up+")'>上一页</a>";
			str1+="  <a href='javascript:void(0);' onclick='rw("+down+")'>下一页</a>";
			str1+="  <a href='javascript:void(0);' onclick='rw("+endPage+")'>最后一页</a></center>" ;
			$("#bb").append(str1);
			}
			}
			
		});
  }
</script> 
</head>

<body style=" margin:0 auto;  width:1100px;margin-top: 30px">
 <div style="border:1px solid #000">
 <div align="center"><font size="5">欢迎进入进程管控系统</font></div>
 <div style="border:1px solid #000">
 个人登入帐号：<b>${user.username}</b>  姓名：<b>${user.realname}</b>  <a href="userExit.action" style="float:right;"><b>注销</b></a>
 </div>
 </div>
 <div id="container" style="border:1px solid #000"></div>
<div style="border:1px solid #000">
<center>近期任务</center>
 <table>
 
  <s:iterator value="workUrl" var="url">
 <tr>
	项目名称：<a href="performPage.action?projectId=${url.task.project.id}&	urlId=${url.id}&taskId=${url.task.id}" title="点击可查询详细信息">${url.task.project.projectname}</a>
	上级领导：${url.task.userUpper.realname}
	项目任务：<a href="${pageContext.request.contextPath}/down.do?resourceName=${url.docUrl }">${url.docUrl }</a>
 </tr>
 <br>
 </s:iterator>
 </table>
 </div>
 <div style="border:1px solid #000" id="oo">

 </div>
 
 <div style="border:1px solid #000" id="bb">
 
 </div>

<div id="projectSelect">
<center>${statuName}</center>
 <table>
 
  <s:iterator value="status" var="url">
 <tr>
	项目名称：<a href="javascript:void(0);" title="点击可查询详细信息" link="cjdata.action?projectId=${url.task.project.id}">${url.task.project.projectname}</a>
	上级领导：${url.task.userUpper.realname}
	项目人：<a href="selectTime.action?gotoid=${url.url1.id}">${url.task.userLower.realname }</a>
	任务类型：${url.urlType}
 </tr>
 <br>
 </s:iterator>
 </table>
 </div>
 
 
 


















<div style="border:1px solid #000">
<!-- 汇报情况<br> -->
<c:if test="${fun:length(urlList) > 0}"> 
 <table>
<center>计划信息</center>
  <s:iterator value="%{urlList}" var="url">
 <tr>
 <td>项目名称：${url.task.project.projectname}</td>
<td>&nbsp;</td>
 <td>执行人：${url.task.userLower.realname}</td>
 <td>&nbsp;</td>
 <td>汇报工作：<a href="${pageContext.request.contextPath}/down.do?resourceName=${url.docUrl }">${url.docUrl }</a></td>
 </tr>
 </s:iterator>
 
 </table>
 </c:if>
 <c:if test="${fun:length(urlDList) > 0}"> 
 <div style="border:1px dashed #000;width:1090px"></div>
 <table>
<center>执行信息</center>
  <s:iterator value="%{urlDList}" var="url">
 <tr>
 <td>项目名称：${url.task.project.projectname}</td>
<td>&nbsp;</td>
 <td>执行人：${url.task.userLower.realname}</td>
 <td>&nbsp;</td>
 <td>汇报工作：<a href="${pageContext.request.contextPath}/down.do?resourceName=${url.docUrl }">${url.docUrl }</a></td>
 </tr>
 </s:iterator>
 </table>
 </c:if>
 <c:if test="${fun:length(urlCList) > 0}"> 
 <div style="border:1px dashed #000;width:1090px"></div>
  <table>
<center>检查信息</center>
  <s:iterator value="%{urlCList}" var="url">
 <tr>
 <td>项目名称：${url.task.project.projectname}</td>
<td>&nbsp;</td>
 <td>执行人：${url.task.userLower.realname}</td>
 <td>&nbsp;</td>
 <td>汇报工作：<a href="${pageContext.request.contextPath}/down.do?resourceName=${url.docUrl }">${url.docUrl }</a></td>
 </tr>
 </s:iterator>
 </table>
 </c:if>
  <c:if test="${fun:length(urlAList) > 0}"> 
 <div style="border:1px dashed #000;width:1090px"></div>
 <table>
<center>反馈信息</center>
  <s:iterator value="%{urlAList}" var="url">
 <tr>
 <td>项目名称：${url.task.project.projectname}</td>
<td>&nbsp;</td>
 <td>执行人：${url.task.userLower.realname}</td>
 <td>&nbsp;</td>
 <td>汇报工作：<a href="${pageContext.request.contextPath}/down.do?resourceName=${url.docUrl }">${url.docUrl }</a></td>
 </tr>
 </s:iterator>
 </table>
</c:if>
</div>


 <div style="border:1px solid #000">
<center>动态信息</center>
  <div style="border:1px solid #000" align="center">
 <table>
 <s:iterator value="%{bulletinList}" var ="bulletin">
 <tr>
 <td>发布人：<b>${bulletin.user.realname}</b></td>
<td>&nbsp;</td>
 <td>发布日期：<fmt:formatDate value="${bulletin.publishTime}" type="date" pattern="yyyy-MM-dd HH:mm:ss"/></td>
 <td>&nbsp;</td>
 <td>内容：${bulletin.content}</td>
 </tr>
</s:iterator>
 </table>
 </div>
 
  
 <div style="border:1px solid #000" align="center">
 <table>
<tr>
<td>
  <c:if test="${user.role.grade==1}">
<input type="button" value="录入项目信息" onclick="javascript:location.href='entryPage.action'"/>

</c:if>
<input type="button" value="查看项目详情" onclick="javascript:location.href='checkProject.action'"/>
<input type="button" value="发布公告" onclick="javascript:location.href='bulletin.action'"/>
</td>
</tr>
 </table>
 </div>
</div>
</body>
</html>
