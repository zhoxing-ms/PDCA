<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String type = request.getParameter("type");
String  pageNum=request.getParameter("pageNum");
 int pageNum1= Integer.parseInt(pageNum);
 
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<html>
  <head>
    <script type="text/javascript" src="GoogleChart/js/jsapi.js"></script>
    <script type="text/javascript" src="style/js/jquery-1.8.3.min.js"></script>
  <script type="text/javascript" src="style/js/highcharts.js"></script>
  <script type="text/javascript" src="style/js/exporting.js"></script>
  <!--<link rel="stylesheet" href="style/css/amazeui.min.css" />-->
  <link rel="stylesheet" type="text/css" href="GoogleChart/css/orgchart.css">
<link rel="stylesheet" href="styleNew/css/Style.css" type="text/css">
 
  <script type="text/javascript">
  function fanye(obj){
  var pageNum=${pageNum};
  var endPage=${endPage}; 
  	nextPage=pageNum+1;
    PreviousPage=pageNum-1;
//  alert(endPage);
if(obj.id=='next'){
	if(nextPage<=endPage){
	window.location.href="cjdata.action?type=${type}&pageNum="+nextPage;
	}
  }
 if(obj.id=='first'){	
	window.location.href="cjdata.action?type=${type}&pageNum=1";
  }
  if(obj.id=='Previous'){
	if(PreviousPage>0){
	window.location.href="cjdata.action?type=${type}&pageNum="+PreviousPage;
	}
  }
  if(obj.id=='last'){	
	window.location.href="cjdata.action?type=${type}&pageNum=${endPage}";
  }
 }
</script>
  <script type="text/javascript">
﻿$(function () {
    	$.ajax({	
   			    type : "POST",
				url : "Data.action",
				data : {
				}, 
				dataType:"json",
				success : function(data){
						$(function () {
    		var colors = Highcharts.getOptions().colors;
    // Build the data arrays
    
    var parent = document.getElementById("container");
    
    for(var i=0;i<data.projectnumber;i++){
    	
    	var div = document.createElement("div");
    	div.setAttribute("id","container"+(i+1));
    	/*div.setAttribute("float","left");
    	div.setAttribute("height","300px");
    	div.setAttribute("width","100%");*/
    	parent.appendChild(div);
    	}
 
    var jsonList  = eval(data.options);
  
    for(var i =0;i<jsonList.length;i++){
    var browserData = [];
    var versionsData = [];
    var projectname;
    var j = 2,k=2;
                 	$.each(jsonList[i].p1, function (i,d) {
                 	
                   	  browserData.push([d.realname,d.per,colors[4]]);
                   	  j++;
                   	  projectname = d.projectname;
                   	  //versionsData.push([d[0].p2[0].Finished,d[0].p2[0].per,colors[j]]);
                   	 	if(d.p2!=null){
                   	 		$.each(d.p2,function(i,d){
                   	 			versionsData.push([d.Finished,d.per,colors[4]]);
                   	 			k++;
                   	 		});
                   	 	}
                 	});
     
    // Create the chart
   
    $('#container'+(i+1)).highcharts({
        chart: {
            type: 'pie'
        },
        title: {
            text: ''+projectname
        },
        yAxis: {
            title: {
                text: 'Total percent market share'
            }
        },
        plotOptions: {
            pie: {
                shadow: false,
                center: ['50%', '50%']
            }
        },
        tooltip: {
    	    valueSuffix: '%'
        },
        credits: {  
  				enabled: false  
		},  
        series: [{
            name: 'Browsers',
            data: browserData,
            size: '60%',
            dataLabels: {
                formatter: function() {
                    return this.y > 5 ? this.point.name : null;
                },
                color: 'white',
                distance: -30
            }
        }, {
            name: 'Versions',
            data: versionsData,
            size: '80%',
            innerSize: '60%',
            dataLabels: {
                formatter: function() {
                    // display only if larger than 1
                    return this.y > 1 ? '<b>'+ this.point.name +':</b> '+ this.y +'%'  : null;
                }
            }
        }]
    });
    }
});
}
});
})
</script></link>
  </script>
    <script type="text/javascript"> 
      		google.load("visualization", "1", {packages:["orgchart"]});
      		google.setOnLoadCallback(drawChart);
      			function drawChart() {
	      			$(function () {
	    				$.ajax({	
	   			    	type : "POST",
						url : "getChart.action",
						data : { }, 
						dataType:"json",
						success : function(data){
							$(function () {
								var jsonList = eval(data.options);
								var parent = document.getElementById("chart_div");
								for(var i = 0;i<jsonList.length;i++){
									var div = document.createElement("div");
			    					div.setAttribute("id","chart_div"+(i+1));
			    					div.setAttribute("float","left");
			    					div.setAttribute("height","300px");
			    					div.setAttribute("width","100%");
			    					parent.appendChild(div);
			    				}
			    				
			      				for(var i = 0;i<jsonList.length;i++){
			      					var browserData = [];
			      					browserData.push(["<a href=\""+jsonList[i].href+"\">"+jsonList[i].deliver+"</a>",
			      					                  "<a href=\""+jsonList[i].href+"\">"+jsonList[i].deliver+"</a>",'']);
			      					$.each(jsonList[i].p1, function (i,d) {
			      			
                   	  				browserData.push(
                   	  				["<a href=\""+d.href+"\">"+d.userLower+"</a>","<a href=\""+d.href+"\">"+d.userUpper+"</a>",'']);
                   	  				});
			        				var data1 = new google.visualization.DataTable();
			       	 				data1.addColumn('string', 'Name');
			        				data1.addColumn('string', 'Manager');
			        				data1.addColumn('string', 'ToolTip');
			        				data1.addRows(browserData);
			        				var chart = new google.visualization.OrgChart(document.getElementById('chart_div'+(i+1)));
			        				chart.draw(data1, {allowHtml:true,allowCollapse:true,size:"large"});
			 				}
			});
			}
			});
	})     		
}
   </script>

   <style type="text/css">  
body
{
  -moz-user-select:   none;
}
#container{
 width:65%;
 margin:0px;
 float:left;
 height:300px;
}
#container div{
 width:100%;
 margin:0px;
 float:left;
 height:300px;
}
#chart_div{
 width:30%;
 margin:0px auto;
 float:left;
 height:300px;

}
#chart_div div{
width:100%;
margin:0px auto;
height:300px;
}
   </style>
    </head>
  <body >
<table width="100%" border="0" cellpadding="0" cellspacing="0" class="currentTable"><tr><td>
	<table width="100%" border="0" cellpadding="0" cellspacing="0" class="currentTable">
		<tr class="currentpath">
			<td width="40px"><img src="<%=request.getContextPath()%>/styleNew/images/currentpath_1.gif"></td>
			<td>当前位置：${statuName}任务成员分布图</td>
			<td width="10px"><img src="<%=request.getContextPath()%>/styleNew/images/currentpath_2.gif"></td>
		</tr>
	</table>

<table width="100%" border="0" cellpadding="0" cellspacing="1" class="table_show">
		<tr>
			<td colspan="2" style="padding-left: 0px;">
		 <table width="100%" border="0" cellpadding="1" cellspacing="1" >
         <tr>
         <td>
              
         </td>
         </tr>
         </table>
<table width="100%" border="0" cellpadding="1" cellspacing="1" >
		 <tr class="list_top_title">		   
          <td width="37" align="center" nowrap><img src="<%=request.getContextPath()%>/styleNew/images/chengyuanfenbu.gif" border="0" /></td>
          <td width="864" align="left" nowrap><strong>${statuName}任务成员分布图</strong></td>
		  <td width="387" align="center" nowrap>
   <input type="button"  id="first" value="首页" onclick="fanye(this);" class="button"/>&nbsp;
   <input type="button"  id="Previous" value="上一页" onclick="fanye(this);" class="button"/>&nbsp;
   <input type="button"  id="next" value="下一页" onclick="fanye(this);" class="button"/>  &nbsp;
   <input type="button"  id="last" value="尾页" onclick="fanye(this);" class="button"/>&nbsp;
          </td>
		 </tr>

	<tr align="center">
      <td height="28" colspan="3" align="center" bgcolor="#FFFFFF">
 <center>
   <div id="container" style="height:600px"></div> 
   <div id="chart_div"  style="height:600px"></div>
 </center>      </td>
      </tr>
    <tr bgcolor="#DDDDEC">
      <td height="1" colspan="5"></td>
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