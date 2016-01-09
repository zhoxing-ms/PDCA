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
		var num = document.getElementById("num").value;
			$().timelinr({
				autoPlay: 'true',
				autoPlayDirection: 'forward',
				startAt: num
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
		$("#ww").empty();
		$("#ee").empty();
		
		var time = this.id;
		$.ajax({
			type : "POST",
			url : "getInfo.action",
			data : {
				"time" : time
			},
			dataType : "json",
			success : function(data) {
			
				var str = "";
				var str1 ="";
				var str2 ="";
				var str3 ="";
//yq				str1+="<table border='2'width='500px'>"; 
//yq			 	str1+="<tr  align='center'><td>执行人</td><td>任务类型</td><td>提交时间</td><td>完成情况</td></tr>";
//yq			 	str2+="<table border='2'width='500px'>"; 
//yq			 	str2+="<tr  align='center'><td>执行人</td><td>任务类型</td><td>提交时间</td><td>完成情况</td></tr>";
				var num1 = 0;
				var num2 = 0;
				$.each(data, function(index, val) {
					num1++;
					var p = "P";
					var d = "D";
					var c = "C";
					var a = "A";
					var urlType = val.urlType;
					var states = val.states;
					var user = val.task.userUpper.id;
					var user1 = ${user.id};
					var user2 = val.task.userLower.id;
					if(user == user1&&user!=user2){
							str1+="<tr align='center' class='tr_list_1'>";
							str1+="<td>"; 
							str1 += val.task.userLower.realname;
							str1+="</td>";
							str1+="<td>"; 
							if(urlType == p) {
							str1 += "计划任务";
							}
							if(urlType == d) {
							str1 += "执行任务";
							}
							if(urlType == c) {
							str1 += "检查任务";
							}
							if(urlType == a) {
							str1 += "反馈任务";
							}
							str1+="</td>";
							str1+="<td>"; 
							if(val.subtime!=null){
							var date = new Date(val.subtime);
							str1+=dateToStr(date);
							}
							str1+="</td>";
							str1+="<td>"; 
							if (states == "已完成"){
							if(val.checkstates!=null){
							str1 += "已完成"+"("+val.checkstates+")";
							}else{
							str1 += "已完成";
							}
							
							}
							if (states == null){
							str1 += "未完成";
							}
							str1+="</td>";
							str1+="</tr>"; 
					}
					if(user != user1||user==user2){
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
							if(urlType == p) {
							str2 += "<a href='gotosubmitPlan.action?gotoid="+val.id+"'><font color='#FF0000'>待完成</font></a>";
							}
							if(urlType == d) {
							str2 += "<a href='gotosubmit.action?gotoid="+val.id+"'><font color='#FF0000'>待完成</font></a>";
							}
							if(urlType == c) {
							str2 += "<a href='gotosubmitCheck.action?gotoid="+val.id+"'><font color='#FF0000'>待完成</font></a>";
							}
							if(urlType == a) {
							str2 += "<a href='gotosubmitAction.action?gotoid="+val.id+"'><font color='#FF0000'>待完成</font></a>";
							}
							
							}
							str2+="</td>";
							str2+="</tr>"; 
					
					
					
						/* if (urlType == p) {
						if (states == "已完成") {
							str +=  "你的计划任务已完成"+"<br>";
							num2++;
						} else {
							str +=  "你的计划任务未完成"+"&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;";
							str+="<a href='gotosubmitPlan.action?gotoid="+val.id+"'>待完成</a>"
						}
					}
					if (urlType == d) {
						if (states == "已完成") {
							str += "你的执行任务已完成"+"<br>";
							num2++;
						} else {
							str += "你的执行任务未完成"+"&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;";
							str+="<a href='gotosubmit.action?gotoid="+val.id+"'>待完成</a>"
						}
					}
					if (urlType == c) {
						if (states == "已完成") {
							str += "你的检查任务已完成"+"<br>";
							num2++;
						} else {
							str += "你的检查任务未完成"+"&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;";
							str+="<a href='gotosubmitCheck.action?gotoid="+val.id+"'>待完成</a>"
						}
					}
					
					
					if (urlType == a) {
						if (states == "已完成") {
							str +=  "你的反馈任务已完成"+"<br>";
							num2++;
						} else {
							str += "你的反馈任务未完成"+"&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;";
							str+="<a href='gotosubmit.action?gotoid="+val.id+"'>待完成</a>"
						}
					} */
					}
					
				});
//yq				str1+="</table>";
//yq				str2+="</table>";
				/*  str1+= "</table>"; */
				//str2+="进度："+num2*100/num1;
				if(str2!=""){
//yq				$("#oo").append("你的完成情况：<br>");
				$("#oo").append(str2);
				}else{
				$("#oo").append("<tr align='center' class='tr_list_1'><td colspan='4' align='left'>&nbsp;&nbsp;暂无</td></tr>");
				
				}
				
				if(str1!=""){
//yq				$("#ww").append("下级完成情况：<br>");
				$("#ww").append(str1);
				}
				else{
				$("#ww").append("<tr align='center' class='tr_list_1'><td colspan='4' align='left'>&nbsp;&nbsp;暂无</td></tr>");
				}
				/* if(str!=""||str1!=""){
				$("#ee").append("-------------------------------------------------------------------");
				}
				$("#pp").append(str2); */
				
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
			<td>当前位置：项目执行情况</td>
			<td width="10px"><img src="<%=request.getContextPath()%>/styleNew/images/currentpath_2.gif"></td>
		</tr>
	</table>
<input type="hidden" value="${user.id}">
<input type="hidden" value="${postNum}" id="num"> 

<table width="100%" border="0" cellpadding="0" cellspacing="1" class="table_show">
		<tr>
			<td colspan="2" style="padding-left: 0px;">
              <table border="0" cellpadding="0" cellspacing="0" class="t_list_top_menu" style="width:100%;">
                <tr>
                <td>&nbsp;&nbsp;
                    <a href="makeplanPage.action"><img src="<%=request.getContextPath()%>/styleNew/images/xiangxi.gif" border="0" class="opacity" /></a>&nbsp;&nbsp;&nbsp;&nbsp;
                    <a href="makeplanPage1.action"><img src="<%=request.getContextPath()%>/styleNew/images/zxren.gif" border="0" /></a>&nbsp;&nbsp;
                    <a href="makeplanC.action"><img src="<%=request.getContextPath()%>/styleNew/images/jcren.gif" border="0" /></a>&nbsp;&nbsp;
<c:if test="${urlIdAdd!=''}">
                    <a href="makeplanA.action"><img src="<%=request.getContextPath()%>/styleNew/images/fankui.gif" border="0" /></a>&nbsp;&nbsp;
</c:if>
<c:if test="${urlIdAdd!=''}">
                    <a href="changeUser.action"><img src="<%=request.getContextPath()%>/styleNew/images/zhuanjiao.gif" border="0" /></a>&nbsp;&nbsp;
</c:if>
                   
                                    </td>
                <td align="right" >&nbsp;</td>
                </tr>
                <tr>
                  <td colspan="2" style=" height:1px; background:#CCCCCC"></td>
                  </tr>
                </table>
<!--时间线-->
              <table border="0" cellpadding="0" cellspacing="0" class="table_timeline" style="width:100%;">
                <tr>
                <td>
	<div id="timeline">
		<ul id="dates">
		<s:iterator value="%{countListOfTime}" var="count">
		<c:if test="${count.advance=='未完成'}"> 
		<li><a href="${count.url.endtime}"  id="<fmt:formatDate value='${count.url.endtime}' type='date' pattern='yyyy-MM-dd HH:mm:ss'/>" onclick="cli.call(this);">
			<font color="#ffff0000"><fmt:formatDate value="${count.url.endtime}" type="date" pattern="yyyy/MM/dd"/></font></a>
			</li>
		</c:if> 
		 <c:if test="${count.advance=='完成'}">
		<li><a href="${count.url.endtime}"  id="<fmt:formatDate value='${count.url.endtime}' type='date' pattern='yyyy-MM-dd HH:mm:ss'/>" onclick="cli.call(this);">
			<fmt:formatDate value="${count.url.endtime}" type="date" pattern="yyyy/MM/dd" /></a>
			</li>
		</c:if>
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
                      <td width="1253" align="left" nowrap><strong>你的完成情况</strong></td>
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
    <tbody id="oo">
    </tbody>
    
    <tr bgcolor="#DDDDEC">
      <td height="1" colspan="7"></td>
    </tr>
</table>

<table width="100%" border="0" cellpadding="1" cellspacing="1" >
		 <tr class="list_top_title">		   
          <td colspan="4" align="center">
            <table width="100%" border="0" cellpadding="1" cellspacing="1" >
                     <tr>		   
                      <td width="38" align="center" nowrap><img src="<%=request.getContextPath()%>/styleNew/images/ren2.gif" border="0" /></td>
                      <td width="1253" align="left" nowrap><strong>下级完成情况</strong></td>
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
    <tbody id="ww">
    </tbody>
    
    <tr bgcolor="#DDDDEC">
      <td height="1" colspan="7"></td>
    </tr>
</table>

            </td></tr></table>
</td></tr></table>

</body>
</html>
