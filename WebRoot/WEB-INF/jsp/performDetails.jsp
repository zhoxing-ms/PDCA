<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<link rel="stylesheet" href="styleNew/css/Style.css" type="text/css">
<head>
<script src="style/js/jquery-1.8.3.min.js" type="text/javascript"></script>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>无标题文档</title>
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

<script type="text/javascript">
	$(function() {

		$(".deleteId").on("click", function() {
			var id = $(this).prev("input").val(); 
			//alert(id);
			$.ajax({
				url : "deleteUrl.action",
				cache : false,
				type : "POST",
				data : {
					"deleteId" : id
				},
			});
			$("#"+id).remove();

		});

	});
</script>


</head>

<body>
<table width="100%" border="0" cellpadding="0" cellspacing="0" class="currentTable"><tr><td>
	<table width="100%" border="0" cellpadding="0" cellspacing="0" class="currentTable">
		<tr class="currentpath">
			<td width="40px"><img src="<%=request.getContextPath()%>/styleNew/images/currentpath_1.gif"></td>
			<td>当前位置：项目详情 </td>
			<td width="10px"><img src="<%=request.getContextPath()%>/styleNew/images/currentpath_2.gif"></td>
		</tr>
	</table>
<input type="hidden" value="${user.id}">
<input type="hidden" value="${postNum}" id="num"> 

<table width="100%" border="0" cellpadding="0" cellspacing="1" class="table_show">
		<tr>
			<td colspan="2" style="padding-left: 0px;">
                
<table width="100%" border="0" cellpadding="1" cellspacing="1" >
		 <tr class="list_top_title">		   
          <td colspan="5" align="center">
            <table width="100%" border="0" cellpadding="1" cellspacing="1" >
                     <tr>		   
                      <td width="38" align="center" nowrap><img src="<%=request.getContextPath()%>/styleNew/images/renwu.gif" border="0" /></td>
                      <td align="left" nowrap><strong>已安排任务</strong></td>
                     </tr>
            </table>
          </td>
          </tr>
		 <tr style="height:25px; background:#F9F9F9">		   
          <td width="254" align="center">项目信息</td>
          <td width="180" align="center">下属名称</td>
          <td align="center">下级任务</td>
          <td width="219" align="center">时间轴详情</td>
          <td width="164" align="center">操作</td>
        </tr>
<s:iterator value="countList" var="count">
        <tr id="${count.url.id}" align='center' class='tr_list_1'> 
        <td>${count.url.task.project.projectname} </td>   
        <td><a href="selectLowerPerform.action?lowerUrlId=${count.url.id}">${count.url.task.userLower.realname}</a></td>   
        <td align="center">&nbsp;<a href="down.do?resourceName=${count.url.docUrl }">${count.url.docUrl}</a></td>   
        <td><a href="selectTime.action?gotoid=${count.url.id}">具体详情${count.url.id}</a></td>   
        <td nowrap="nowrap">
        <input type="button" value="更改" class="deleteId" onclick="javascript:location.href='changeplan.action?updateId=${count.url.id}' "/>
        <input type="hidden" value="${count.url.id}"> 
        <input type="button" id="deleteId" value="删除" class="deleteId" />  <%--  //class="button2"
        
        --%></td>   
        </tr>
        </s:iterator>
    <tr bgcolor="#DDDDEC">
      <td height="1" colspan="7"></td>
    </tr>
</table>

<table width="100%" border="0" cellpadding="1" cellspacing="1" >
		 <tr class="list_top_title">		   
          <td colspan="6" align="center">
            <table width="100%" border="0" cellpadding="1" cellspacing="1" >
                     <tr>		   
                      <td width="38" align="center" nowrap><img src="<%=request.getContextPath()%>/styleNew/images/jutixingxi.gif" border="0" /></td>
                      <td align="left" nowrap><strong>具体信息</strong></td>
                     </tr>
            </table>
          </td>
          </tr> 
		 <tr style="height:25px; background:#F9F9F9">		   
          <td width="254" align="center">项目信息</td>
          <td width="180" align="center">执行人</td>
          <td  align="center">任务类型</td>
          <td width="142" align="center">提交时间</td>
          <td width="112" align="center"> 截止时间</td>
          <td width="117" align="center"> 完成情况</td>
        </tr>
        
			<s:iterator value="urlListOfDone" var="url">
				<tr align='center' class='tr_list_1'> 
					<td>${url.task.project.projectname} </td>
					<td>${url.task.userLower.realname}</td>
					<c:if test="${url.urlType=='P'}">
					<td>计划任务</td>
					</c:if>
					<c:if test="${url.urlType=='D'}">
					<td>执行任务</td>
					</c:if>
					<c:if test="${url.urlType=='C'}">
					<td>检查任务</td>
					</c:if>
					<c:if test="${url.urlType=='A'}">
					<td>反馈任务</td>
					</c:if>
					<td><fmt:formatDate value="${url.subtime}" type="date" pattern="yyyy-MM-dd HH:mm:ss"/></td>
					<td><fmt:formatDate value="${url.endtime}" type="date" pattern="yyyy-MM-dd"/></td>
					<td> 待完成</td>
				</tr>
			</s:iterator>
			<s:iterator value="urlListOfUnfinished" var="url">
				<tr align='center' class='tr_list_1'> 
					<td>${url.task.project.projectname} </td>
					<td>${url.task.userLower.realname}</td>
					<c:if test="${url.urlType=='P'}">
					<td>计划任务</td>
					</c:if>
					<c:if test="${url.urlType=='D'}">
					<td>执行任务</td>
					</c:if>
					<c:if test="${url.urlType=='C'}">
					<td>检查任务</td>
					</c:if>
					<c:if test="${url.urlType=='A'}">
					<td>反馈任务</td>
					</c:if>
					<td><fmt:formatDate value="${url.subtime}" type="date" pattern="yyyy-MM-dd HH:mm:ss"/></td>
					<td><fmt:formatDate value="${url.endtime}" type="date" pattern="yyyy-MM-dd"/></td>
					<td>未完成</td>
				</tr>
			</s:iterator>
			<s:iterator value="urlListOfFinished" var="url">
				<tr align='center' class='tr_list_1'> 
					<td>${url.task.project.projectname} </td>
					<td>${url.task.userLower.realname}</td>
					<c:if test="${url.urlType=='P'}">
					<td>计划任务</td>
					</c:if>
					<c:if test="${url.urlType=='D'}">
					<td>执行任务</td>
					</c:if>
					<c:if test="${url.urlType=='C'}">
					<td>检查任务</td>
					</c:if>
					<c:if test="${url.urlType=='A'}">
					<td>反馈任务</td>
					</c:if>
					<td><fmt:formatDate value="${url.subtime}" type="date" pattern="yyyy-MM-dd HH:mm:ss"/></td>
					<td><fmt:formatDate value="${url.endtime}" type="date" pattern="yyyy-MM-dd"/></td>
					<td>已完成</td>
				</tr>
			</s:iterator>
    <tr bgcolor="#DDDDEC">
      <td height="1" colspan="7"></td>
    </tr>
</table>


            </td></tr></table>
</td></tr></table>


<!--<br />
<br />
<br />
<br />



<br />
<br />
<br />


<div align="center">
<font size="6">项目详情</font>
  <table width="1000" border="2" >
     <tr>
      <td colspan='9'><div align="center">已安排任务</div></td>
    </tr>
 
    <tr>
      <td><div align="center">项目信息</div></td>
      <td><div align="center">下属名称</div></td>
      <td><div align="center">下级任务</div></td>
      <td><div align="center">时间轴详情</div></td>
  	  <td colspan="2"><div align="center">操作</div></td> 
    </tr>
			<s:iterator value="countList" var="count">
				<tr id="${count.url.id}" align="center">
					<td>${count.url.task.project.projectname} </td>
					<td><a
						href="selectLowerPerform.action?lowerUrlId=${count.url.id}">${count.url.task.userLower.realname}</a>
					</td>
					<td><a href="down.do?resourceName=${count.url.docUrl }">${count.url.docUrl}</a>
					</td>
					<td>
					<div align="center">
						<a href="selectTime.action?gotoid=${count.url.id}">具体详情${count.url.id}</a>
					</div>
					</td>
					
							<td><div align="center">
									<a href="changeplan.action?updateId=${count.url.id}">更改</a>
								</div>
						</td>
						<td><div align="center"><input type="hidden" value="${count.url.id}"> <input
							type="button" id="deleteId" value="删除" class="deleteId" /></div></td>
				</tr>
			</s:iterator>
			</table>
			
			 <table width="1000" border="2" >
			 <tr>
      <td colspan='9'><div align="center">具体信息</div></td>
    </tr>
			  <tr>
      			<td><div align="center">项目信息</div></td>
      			<td><div align="center">执行人</div></td>
      			<td><div align="center">任务类型</div></td>
     			<td><div align="center">提交时间</div></td>
     			<td><div align="center">截止时间</div></td>
     			<td><div align="center">完成情况</div></td>
   			 </tr>
			<s:iterator value="urlListOfDone" var="url">
				<tr align="center">
					<td>${url.task.project.projectname} </td>
					<td>${url.task.userLower.realname}</td>
					<c:if test="${url.urlType=='P'}">
					<td>计划任务</td>
					</c:if>
					<c:if test="${url.urlType=='D'}">
					<td>执行任务</td>
					</c:if>
					<c:if test="${url.urlType=='C'}">
					<td>检查任务</td>
					</c:if>
					<c:if test="${url.urlType=='A'}">
					<td>反馈任务</td>
					</c:if>
					<td><fmt:formatDate value="${url.subtime}" type="date" pattern="yyyy-MM-dd HH:mm:ss"/></td>
					<td><fmt:formatDate value="${url.endtime}" type="date" pattern="yyyy-MM-dd"/></td>
					<td> 待完成</td>
				</tr>
			</s:iterator>
			<s:iterator value="urlListOfUnfinished" var="url">
				<tr align="center">
					<td>${url.task.project.projectname} </td>
					<td>${url.task.userLower.realname}</td>
					<c:if test="${url.urlType=='P'}">
					<td>计划任务</td>
					</c:if>
					<c:if test="${url.urlType=='D'}">
					<td>执行任务</td>
					</c:if>
					<c:if test="${url.urlType=='C'}">
					<td>检查任务</td>
					</c:if>
					<c:if test="${url.urlType=='A'}">
					<td>反馈任务</td>
					</c:if>
					<td><fmt:formatDate value="${url.subtime}" type="date" pattern="yyyy-MM-dd HH:mm:ss"/></td>
					<td><fmt:formatDate value="${url.endtime}" type="date" pattern="yyyy-MM-dd"/></td>
					<td>未完成</td>
				</tr>
			</s:iterator>
			<s:iterator value="urlListOfFinished" var="url">
				<tr align="center">
					<td>${url.task.project.projectname} </td>
					<td>${url.task.userLower.realname}</td>
					<c:if test="${url.urlType=='P'}">
					<td>计划任务</td>
					</c:if>
					<c:if test="${url.urlType=='D'}">
					<td>执行任务</td>
					</c:if>
					<c:if test="${url.urlType=='C'}">
					<td>检查任务</td>
					</c:if>
					<c:if test="${url.urlType=='A'}">
					<td>反馈任务</td>
					</c:if>
					<td><fmt:formatDate value="${url.subtime}" type="date" pattern="yyyy-MM-dd HH:mm:ss"/></td>
					<td><fmt:formatDate value="${url.endtime}" type="date" pattern="yyyy-MM-dd"/></td>
					<td>已完成</td>
				</tr>
			</s:iterator>
			<tr>
    <td colspan="9">
    <center>
    <input type="button" value="返回主界面" onclick="javascript:location.href='returnHome.action' " />
    </center>
    </td>
    </tr>
  </table>
  
  
</div>
-->
</body>
</html>
