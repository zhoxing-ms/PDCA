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
<script type="text/javascript" src="style/js/jquery-1.8.3.min.js"></script>
  <script type="text/javascript" src="style/js/highcharts.js"></script>
  <script type="text/javascript" src="style/js/exporting.js"></script>
  <script type="text/javascript" src="style/js/highcharts-3d.js"></script>

<script type="text/javascript">
﻿	$(function () {
    	$.ajax({	
   			    type : "POST",
				url : "overData.action",
				/* data : {
				}, */
				dataType:"json",
				success : function(data) {
					//alert(data.size);
					/*if(data.size==0){
						$(document).ready(function () {
							$('#container').text("主人，您没有发布项目，无法展示不能您的才能，原谅mimi.").css({"color":"red","font-weight":"50","size":"30"});
						 })
					}
					else{*/
						
							$(function () {
   		 var chart;
    $(document).ready(function () {
			 $('#container').highcharts({
            chart: {
                plotBackgroundColor: null,
                plotBorderWidth: null,
                plotShadow: false
            },
            title: {
                text: '项目完成情况'
            },
            tooltip: {
        	    pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
            },
            plotOptions: {
                pie: {
                    allowPointSelect: true,
                    cursor: 'pointer',
                    dataLabels: {
                        enabled: false
                    },
                    showInLegend: true
                }
            },
            credits: {  
  					enabled: false  
 			},  
            
            
            series: [{
                type: 'pie',
                name: '情况比例',
                data: [
                ['及时完成',data.Timely],
                ['提前完成',data.Earlier],
                ['正在进行',data.Underway],
                ['未完成',data.Unfinished]
            ],
            events: {
                         click: function (e) {
                         //alert(e.point.name); //弹出提示
                         if(e.point.name=='未完成'){
                         location.href='cjdata.action?type=Unfinished&pageNum=1';  //页面跳转
                         }
                         if(e.point.name=='提前完成'){
                         location.href='cjdata.action?type=Earlier&pageNum=1';  //页面跳转
                         }
                         if(e.point.name=='及时完成'){
                         location.href='cjdata.action?type=Timely&pageNum=1';  //页面跳转
                         }
                         if(e.point.name=='正在进行'){
                         location.href='cjdata.action?type=Underway&pageNum=1';  //页面跳转
                         }
                   }
              }
            }]
        });
    });
    
});
			/* 以上是拼图代码	 */
				}
				//}
			});
	});
  </script>


<script type="text/javascript">

    ﻿$(function () {
    	$.ajax({	
   			    type : "POST",
				url : "appraise.action",
				/* data : {
				}, */
				dataType:"json",
				success : function(data) {
					//alert(data.sum);
					if(data.sum==0){
						 $(document).ready(function () {
							$('#container1').text("暂无下级提交任务。").css({"color":"red","font-weight":"50","size":"30"});
						 })
					}
					else{
						
				$(function () {
    var chart;
    $(document).ready(function () {
    	
    	// Build the chart
         $('#container1').highcharts({
            chart: {
                plotBackgroundColor: null,
                plotBorderWidth: null,
                plotShadow: false
            },
            title: {
                text: '项目总体评价'
            },
            tooltip: {
        	    pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
            },
            plotOptions: {
                pie: {
                    allowPointSelect: true,
                    cursor: 'pointer',
                    dataLabels: {
                        enabled: false
                    },
                    showInLegend: true
                }
            },
            credits: {  
  					enabled: false  
			},  
            series: [{
                type: 'pie',
                name: '情况比例',
                data: [
                       {
                    	   name:'优秀',
                    	   color:'#ADFF2F',
                    	   y:data.youxiu
                       },
                       {
                    	   name:'良好',
                    	   color:'#FFFF00',
                    	   y:data.lianghao
                       },
                       {
                    	   name:'很差',
                    	   color:'#FF0000',
                    	   y:data.hencha
                       }
                   		
                       
                /*['优秀',data.youxiu],
                ['良好',data.lianghao],
                ['合格',data.jige],
                ['很差',data.hencha]*/
            ],
             events: {
                         click: function (e) {
                         //alert(e.point.name); //弹出提示
                          location.href='checkProject.action';                      
                   }
              }
            
            }]
        });
    });
    
});
			/* 以上是拼图代码	 */
				}
				}
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
		$("#oo_fy").empty();
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
				var str1_page="";
//yq				str1+="<center>已发布项目列表</center>"
//yq				str1+="<table>"; 
				$.each(data, function(index, val) {
				num=val.p;
				num1=val.d;
				var date = new Date(val.project.startTime);
				  
			str1+="<tr>";
 			str1+="<td align='center'><div><a href='performPage.action?projectId="+val.project.id+"&advance="+val.advance+"' title='点击可查询详细信息'>"+val.project.projectname+"</a></div></td><td>"+dateToStr(date)+"</td>";		
 			str1+="</tr>";
 		
//yq			str1+="</table>";
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
			if(endPage<=1){
			str1_page+="<font color='#e0e0e0'></font>&nbsp;&nbsp;";
			}else{
			str1_page+="<a href='javascript:void(0);' onclick='fb("+1+")'>首页</a>";
			str1_page+="  <a href='javascript:void(0);' onclick='fb("+up+")'>上一页</a>";
			str1_page+="  <a href='javascript:void(0);' onclick='fb("+down+")'>下一页</a>";
			str1_page+="  <a href='javascript:void(0);' onclick='fb("+endPage+")'>尾页</a>&nbsp;&nbsp;" ;
			}
			$("#oo").append(str1);
			$("#oo_fy").append(str1_page);
			
			
			}
		});
  }

</script> 

  <script type="text/javascript">
  function rw(pageNum){ 
  
		$("#bb").empty();
		$("#bb_fy").empty();
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
				var str1_page = "";
//yq				str1+="<center>任务项目列表</center>"
//yq				str1+="<table>"; 
				$.each(data, function(index, val) {
				num=val.p;
				num1=val.d;
				str1+="<tr>";
				str1+="<td align='center'><a href='performPage.action?projectId="+val.url.task.project.id+"&urlId="+val.url.id+"&taskId="+val.url.task.id+"'title='点击可查询详细信息'>"+val.url.task.project.projectname+"</a></td><td>"+val.url.task.userUpper.realname+"</td><td><a href='${pageContext.request.contextPath}/down.do?resourceName="+val.url.docUrl+"'>"+val.url.docUrl+"</a></td>";
//yq 				str1+="</tr>";
//yq				str1+="</table>";
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
			if(endPage<=1){
			str1_page+="<font color='#feeeee'></font>&nbsp;&nbsp;";
			}else{	
			str1_page+="<a href='javascript:void(0);' onclick='rw("+1+")'>首页</a>";
			str1_page+="  <a href='javascript:void(0);' onclick='rw("+up+")'>上一页</a>";
			str1_page+="  <a href='javascript:void(0);' onclick='rw("+down+")'>下一页</a>";
			str1_page+="  <a href='javascript:void(0);' onclick='rw("+endPage+")'>尾页</a>" ;
			}
			$("#bb").append(str1);
			$("#bb_fy").append(str1_page);
			}
			
		});
  }
</script> 
</head>

<body>
	<table width="100%" border="0" cellpadding="0" cellspacing="0" class="currentTable"><tr><td>
	<table width="100%" border="0" cellpadding="0" cellspacing="0" class="currentTable">
		<tr class="currentpath">
			<td width="40px"><img src="<%=request.getContextPath()%>/styleNew/images/currentpath_1.gif"></td>
			<td>当前位置：首页</td>
			<td width="10px"><img src="<%=request.getContextPath()%>/styleNew/images/currentpath_2.gif"></td>
		</tr>
	</table>

<table width="100%" border="0" cellpadding="0" cellspacing="1" class="table_show">
		<tr>
			<td colspan="2" style="padding-left: 0px;">
		 <table width="100%" border="0" cellpadding="1" cellspacing="1" >
         <tr>
         <td>
              <table border="0" cellpadding="0" cellspacing="0" class="t_list_top_menu" style="width:100%;">
                <tr>
                <td>&nbsp;&nbsp;
                    <%--<c:if test="${user.role.grade==1}"></c:if>--%>
                    <a href="entryPage.action"><img src="<%=request.getContextPath()%>/styleNew/images/ruru.gif" border="0" class="opacity" /></a>&nbsp;&nbsp;&nbsp;&nbsp;
                    
                    <a href="bulletin.action"><img src="<%=request.getContextPath()%>/styleNew/images/gonggao.gif" border="0" /></a>&nbsp;&nbsp;                </td>
                <td align="right" >&nbsp;</td>
                </tr>
                <tr>
                  <td colspan="2" style=" height:1px; background:#CCCCCC"></td>
                  </tr>
                </table>
             <div id="container1"  style=" width:50%; height: 300px; float:left"></div>
             <div id="container" style="width:50%; height: 300px; float:left" ></div>
         </td>
         </tr>
         </table>
<table width="100%" border="0" cellpadding="1" cellspacing="1" >
    <tr bgcolor="#DDDDEC">
      <td height="1" colspan="7"></td>
    </tr>
		 <tr class="list_top_title">		   
          <td colspan="4" align="center">
            <table width="100%" border="0" cellpadding="1" cellspacing="1" >
                     <tr>		   
                      <td width="38" align="center" nowrap><img src="<%=request.getContextPath()%>/styleNew/images/jingqi.gif" border="0" /></td>
                      <td width="1253" align="left" nowrap><strong>近期任务</strong></td>
                     </tr>
            </table>
          </td>
          </tr>
		 <tr style="height:25px; background:#F9F9F9">		   
          <td width="147" align="center">项目名称</td>
          <td width="284" align="center">上级领导</td>
          <td width="218" align="center">项目任务</td>
        </tr>
    <tbody>
    <c:choose>
    <c:when test="${not empty workUrl }">
		<s:iterator value="workUrl" var="url">
             <tr class='tr_list_1'>
                <td align="center"><a href="performPage.action?projectId=${url.task.project.id}&urlId=${url.id}&taskId=${url.task.id}" title="点击可查询详细信息">${url.task.project.projectname}</a></td>
                <td align="center">${url.task.userUpper.realname}</td>
                <td align="center"><a href="performPage.action?projectId=${url.task.project.id}&	urlId=${url.id}&taskId=${url.task.id}" title="点击可查询详细信息">${url.task.project.projectname}</a></td>
                <%-- <td align="center">${url.task.userUpper.realname}</td> 
                <td><a href="${pageContext.request.contextPath}/down.do?resourceName=${url.docUrl }">${url.docUrl }</a></td>--%>
             </tr>
		</s:iterator>
	</c:when>
	<c:otherwise>
		<tr><td align="center">暂无近期任务发布。</td></tr>
	</c:otherwise>
		
	</c:choose>
    </tbody>
    <tr bgcolor="#DDDDEC">
      <td height="1" colspan="7"></td>
    </tr>
</table>

<table width="100%" border="0" cellpadding="1" cellspacing="1" >
		 <tr class="list_top_title">		   
          <td align="left" nowrap>
          <table width="100%" border="0" cellpadding="1" cellspacing="1" >
                     <tr>		   
                      <td width="38" align="center" nowrap><img src="<%=request.getContextPath()%>/styleNew/images/liebiao.gif" border="0" /></td>
                      <td width="1253" align="left" nowrap><strong>项目列表</strong></td>
                     </tr>
            </table></td>
          </tr>

	<tr align="center">
      <td height="28" align="center" bgcolor="#FFFFFF">
          <div class='fenlei_1'>
            <div class='fenleiTit'>已发布项目列表</div>
            <div class='fenleiCon'>
            <table>
            <tr><th>项目名称</th><th style="width:120px;">发布时间</th></tr>
            <tbody id="oo"></tbody>
            <tr><td colspan="2" align="right" id="oo_fy"></td></tr>
            </table>
            </div>
        </div>
      <div class='fenlei_1' style="float:right">
            <div class='fenleiTit'>任务项目列表</div>
            <div class='fenleiCon'>
            <table>
            <tr><th>项目名称</th><th width="70">上级领导</th>
            <th width="200">项目任务</th>
            </tr>
            <tbody id="bb"></tbody>
            <tr><td colspan="3" align="right" id="bb_fy"></td></tr>
            </table>
            </div>
        </div>      </td>
      </tr>
    <tr bgcolor="#DDDDEC">
      <td height="1" colspan="3"></td>
    </tr>
	</table>

<!--汇报信息-->
<c:if test="${fun:length(urlList) > 0}">
<table width="100%" border="0" cellpadding="1" cellspacing="1" >
    <tr bgcolor="#DDDDEC">
      <td height="1" colspan="7"></td>
    </tr>
		 <tr class="list_top_title">		   
          <td colspan="3" align="center">
            <table width="100%" border="0" cellpadding="1" cellspacing="1" >
                     <tr>		   
                      <td width="38" align="center" nowrap><img src="<%=request.getContextPath()%>/styleNew/images/qi1.gif" border="0" /></td>
                      <td width="1253" align="left" nowrap><strong>汇报信息</strong></td>
                     </tr>
            </table>
          </td>
          </tr>
		 <tr style="height:25px; background:#F9F9F9">		   
          <td width="147" align="center">项目名称</td>
          <td width="284" align="center">执行人</td>
          <td width="218" align="center">汇报工作</td>
        </tr>
    <tbody>
            <s:iterator value="%{urlList}" var="url">
            <tr>
            <td align="center">${url.task.project.projectname}</td>
            <td align="center">${url.task.userLower.realname}</td>
            <td><a href="${pageContext.request.contextPath}/down.do?resourceName=${url.docUrl }">${url.docUrl }</a></td>
            </tr>
            </s:iterator>
    </tbody>
    <tr bgcolor="#DDDDEC">
      <td height="1" colspan="7"></td>
    </tr>
</table>
</c:if>

<!--执行信息-->
<c:if test="${fun:length(urlDList) > 0}"> 
<table width="100%" border="0" cellpadding="1" cellspacing="1" >
    <tr bgcolor="#DDDDEC">
      <td height="1" colspan="7"></td>
    </tr>
		 <tr class="list_top_title">		   
          <td colspan="3" align="center">
            <table width="100%" border="0" cellpadding="1" cellspacing="1" >
                     <tr>		   
                      <td width="38" align="center" nowrap><img src="<%=request.getContextPath()%>/styleNew/images/qi2.gif" border="0" /></td>
                      <td width="1253" align="left" nowrap><strong>执行信息</strong></td>
                     </tr>
            </table>
          </td>
          </tr>
		 <tr style="height:25px; background:#F9F9F9">		   
          <td width="147" align="center">项目名称</td>
          <td width="284" align="center">执行人</td>
          <td width="218" align="center">汇报工作</td>
        </tr>
    <tbody>
        <s:iterator value="%{urlDList}" var="url">
        <tr class='tr_list_1'>
        <td align="center">${url.task.project.projectname}</td>
        <td align="center">${url.task.userLower.realname}</td>
        <td><a href="${pageContext.request.contextPath}/down.do?resourceName=${url.docUrl }">${url.docUrl }</a></td>
        </tr>
        </s:iterator>
    </tbody>
    <tr bgcolor="#DDDDEC">
      <td height="1" colspan="7"></td>
    </tr>
</table>
</c:if>

<!--检查信息-->
<c:if test="${fun:length(urlCList) > 0}"> 
<table width="100%" border="0" cellpadding="1" cellspacing="1" >
    <tr bgcolor="#DDDDEC">
      <td height="1" colspan="7"></td>
    </tr>
		 <tr class="list_top_title">		   
          <td colspan="3" align="center">
            <table width="100%" border="0" cellpadding="1" cellspacing="1" >
                     <tr>		   
                      <td width="38" align="center" nowrap><img src="<%=request.getContextPath()%>/styleNew/images/qi3.gif" border="0" /></td>
                      <td width="1253" align="left" nowrap><strong>检查信息</strong></td>
                     </tr>
            </table>
          </td>
          </tr>
		 <tr style="height:25px; background:#F9F9F9">		   
          <td width="147" align="center">项目名称</td>
          <td width="284" align="center">执行人</td>
          <td width="218" align="center">汇报工作</td>
        </tr>
    <tbody>
            <s:iterator value="%{urlCList}" var="url">
            <tr class='tr_list_1'>
            <td align="center">${url.task.project.projectname}</td>
            <td align="center">${url.task.userLower.realname}</td>
            <td><a href="${pageContext.request.contextPath}/down.do?resourceName=${url.docUrl }">${url.docUrl }</a></td>
            </tr>
            </s:iterator>
    </tbody>
    <tr bgcolor="#DDDDEC">
      <td height="1" colspan="7"></td>
    </tr>
</table>
</c:if>

<!--反馈信息-->
<c:if test="${fun:length(urlAList) > 0}"> 
<table width="100%" border="0" cellpadding="1" cellspacing="1" >
    <tr bgcolor="#DDDDEC">
      <td height="1" colspan="7"></td>
    </tr>
		 <tr class="list_top_title">		   
          <td colspan="3" align="center">
            <table width="100%" border="0" cellpadding="1" cellspacing="1" >
                     <tr>		   
                      <td width="38" align="center" nowrap><img src="<%=request.getContextPath()%>/styleNew/images/qi4.gif" border="0" /></td>
                      <td width="1253" align="left" nowrap><strong>反馈信息</strong></td>
                     </tr>
            </table>
          </td>
          </tr>
		 <tr style="height:25px; background:#F9F9F9">		   
          <td width="147" align="center">项目名称</td>
          <td width="284" align="center">执行人</td>
          <td width="218" align="center">汇报工作</td>
        </tr>
    <tbody>
            <s:iterator value="%{urlAList}" var="url">
            <tr class='tr_list_1'>
            <td align="center">${url.task.project.projectname}</td>
            <td align="center">${url.task.userLower.realname}</td>
            <td><a href="${pageContext.request.contextPath}/down.do?resourceName=${url.docUrl }">${url.docUrl }</a></td>
            </tr>
            </s:iterator>
    </tbody>
    <tr bgcolor="#DDDDEC">
      <td height="1" colspan="7"></td>
    </tr>
</table>
</c:if>

<!--动态信息-->
<table width="100%" border="0" cellpadding="1" cellspacing="1" >
    <tr bgcolor="#DDDDEC">
      <td height="1" colspan="7"></td>
    </tr>
		 <tr class="list_top_title">		   
          <td colspan="3" align="center">
            <table width="100%" border="0" cellpadding="1" cellspacing="1" >
                     <tr>		   
                      <td width="38" align="center" nowrap><img src="<%=request.getContextPath()%>/styleNew/images/qi5.gif" border="0" /></td>
                      <td width="1253" align="left" nowrap><strong>动态信息</strong></td>
                     </tr>
            </table>
          </td>
          </tr>
		 <tr style="height:25px; background:#F9F9F9">		   
          <td width="147" align="center">发布人</td>
          <td width="284" align="center">发布日期</td>
          <td width="218" align="center">内容</td>
        </tr>
    <tbody>
            <c:choose>
    	<c:when test="${not empty bulletinList }">
            <s:iterator value="%{bulletinList}" var ="bulletin">
            
            <tr>
            <td align="center"><b>${bulletin.user.realname}</b></td>
            <td align="center"><fmt:formatDate value="${bulletin.publishTime}" type="date" pattern="yyyy-MM-dd HH:mm:ss"/></td>
            <td>${bulletin.content}</td>
            </tr>
            
            </s:iterator>
         </c:when>
            <c:otherwise>
            	<tr><td align="center">暂无公告。</td></tr>
            </c:otherwise>
    </c:choose>
    </tbody>
    <tr bgcolor="#DDDDEC">
      <td height="1" colspan="7"></td>
    </tr>
</table>


	      </td>
		</tr>
		<tr>
		  <td align="left" height="25" class="td_page">&nbsp;</td>
			<td align="right" class="td_page">&nbsp; </td>
		</tr>
</table>
</td></tr></table>


 
</body>
</html>
