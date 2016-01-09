<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<link rel="stylesheet" type="text/css" href="style/css/styles.css" />
<link rel="stylesheet" href="styleNew/css/Style.css" type="text/css">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>无标题文档</title>
<script type="text/javascript" src="style/js/jquery.js"></script>
	<script src="style/js/jquery.timelinr-0.9.4.js" type="text/javascript"></script>
	<script type="text/javascript"> 
		$(function(){
			$().timelinr({
				autoPlay: 'true',
				autoPlayDirection: 'forward',
				startAt: 4
			})
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
 var time = year+"-"+month+"-"+date+" "+hour+":"+minutes+":"+second; //2009-06-12 17:18:05
// alert(time);
 return time;
}
	
	
	function cli() {
		$("#oo").empty();  
		$("#pp").empty();
		var time = this.id;
		var user1 = ${userlower.id};
		$.ajax({
			type : "POST",
			url : "getInfo1.action",
			data : {
				"time" : time,
				"user1":user1
			},
			dataType : "json",
			success : function(data) {
				var str = "";
				var str2 = "";
//				str2+="<table border='2'width='500px'>"; 
//			 	str2+="<tr  align='center'><td>执行人</td><td>任务类型</td><td>提交时间</td><td>完成情况</td></tr>";
				$.each(data, function(index, val) {
					var p = "P";
					var d = "D";
					var c = "C";
					var a = "A";
					var urlType = val.urlType;
					var states = val.states;
							str2+="<tr align='center' class='tr_list_1'>";
							str2+="<td>"; 
							str2 += val.task.userLower.realname;
							str2+="</td>";
							str2+="<td>"; 
							if(urlType == p) {
							str2 += "计划任务";
							}
							if(urlType == d) {
							str2 += "执行任务";
							}
							if(urlType == c) {
							str2 += "检查任务";
							}
							if(urlType == a) {
							str2 += "反馈任务";
							}
							str2+="</td>";
							str2+="<td>"; 
							if(val.subtime!=null){
							var date = new Date(val.subtime);
							str2+=dateToStr(date);
							}
							str2+="</td>";
							str2+="<td>"; 
							if (states == "已完成"){
							if(val.checkstates!=null){
							str2 += "已完成"+"("+val.checkstates+")";
							}else{
							str2 += "已完成";
							}
							
							}
							if (states == null){
							str2 += "未完成";
							}
							str2+="</td>";
							str2+="</tr>"; 
//							str2+="</table>";
				});
				//Yuqiang
//				if(str2==""){
//				str2="<tr align='center' class='tr_list_1'><td colspan='4' align="center">暂无</td></tr>"
//				}
				//Yuqiang end
				$("#pp").append(str2);
				
			}
		});

	}
</script>
</head>
<body id="introduction">
<table width="100%" border="0" cellpadding="0" cellspacing="0" class="currentTable"><tr><td>
	<table width="100%" border="0" cellpadding="0" cellspacing="0" class="currentTable">
		<tr class="currentpath">
			<td width="40px"><img src="<%=request.getContextPath()%>/styleNew/images/currentpath_1.gif"></td>
			<td>当前位置：项目执行</td>
			<td width="10px"><img src="<%=request.getContextPath()%>/styleNew/images/currentpath_2.gif"></td>
		</tr>
	</table>
<input type="hidden" value="${user.id}">
<table width="100%" border="0" cellpadding="0" cellspacing="1" class="table_show">
		<tr>
			<td colspan="2" style="padding-left: 0px;">
<!--时间线-->
              <table border="0" cellpadding="0" cellspacing="0" class="table_timeline" style="width:100%;">
                <tr>
                <td>
	<div id="timeline">
    <ul id="dates">
        <s:iterator value="%{urlTimeList}" var="url">
        <li><a href="${url.endtime}" id="<fmt:formatDate value='${url.endtime}' type='date' pattern='yyyy-MM-dd HH:mm:ss'/>" onclick="cli.call(this);">
        <fmt:formatDate value="${url.endtime}" type="date" pattern="yy:MM:dd"/></a></li>
        </s:iterator>
    </ul>
</div>
                </td>
                </tr>
                <tr>
                  <td style=" height:1px; background:#CCCCCC"></td>
                  </tr>
                </table>
<!--时间线end-->
                
<table width="100%" border="0" cellpadding="1" cellspacing="1" >
		 <tr class="list_top_title">		   
          <td colspan="4" align="center">
            <table width="100%" border="0" cellpadding="1" cellspacing="1" >
                     <tr>		   
                      <td width="38" align="center" nowrap><img src="<%=request.getContextPath()%>/styleNew/images/ren1.gif" border="0" /></td>
                      <td width="1253" align="left" nowrap><strong>完成情况</strong></td>
                     </tr>
            </table>
          </td>
          </tr>
		 <tr style="height:25px; background:#F9F9F9">		   
          <td width="147" align="center">执行人</td>
          <td width="284" align="center">任务类型</td>
          <td width="218" align="center">提交时间</td>
          <td width="404" align="center">完成情况</td>
        </tr>
    <tbody id="pp">
    </tbody>
    
    <tr bgcolor="#DDDDEC">
      <td height="1" colspan="7"></td>
    </tr>
</table>

            </td></tr></table>
</td></tr></table>



<!--<center>
<font size="6">项目执行</font>
<input type="hidden" value="${user.id}">
<table border="2" width="700">
<tr>
<div id="page">
	<div id="container" class="content clearfix">
	
	
	
<div id="timeline">

    <ul id="dates">
        <s:iterator value="%{urlTimeList}" var="url">
        <li><a href="${url.endtime}" id="<fmt:formatDate value='${url.endtime}' type='date' pattern='yyyy-MM-dd HH:mm:ss'/>" onclick="cli.call(this);">
        <fmt:formatDate value="${url.endtime}" type="date" pattern="yy:MM:dd"/></a></li>
        </s:iterator>
    </ul>
    
    <div id="pp"></div>
    <div id="oo"></div>
				
    <div id="grad_left"></div>
    <div id="grad_right"></div>
	
</div>
	
  </div> 
  </div> 
 

</tr>
</table>
</center>-->
</body>
</html>
