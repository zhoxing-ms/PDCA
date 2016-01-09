<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<html>
  <head>
   
    <script type="text/javascript" src="style/js/jquery-1.8.3.min.js"></script>
  <script type="text/javascript" src="style/js/highcharts.js"></script>
  <script type="text/javascript" src="style/js/exporting.js"></script>
    <script type="text/javascript" src="GoogleChart/js/jsapi.js"></script>
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
</script>    
    <script type="text/javascript">
     			
      google.load("visualization", "1", {packages:["orgchart"]});
      google.setOnLoadCallback(drawChart);
      function drawChart() {
      
      var parent = document.getElementById("chart_div1");
		var div = document.createElement("div");
    	div.id = "chart_div2";
    	parent.appendChild(div);
        var data = new google.visualization.DataTable();
        data.addColumn('string', 'Name');
        data.addColumn('string', 'Manager');
        data.addColumn('string', 'ToolTip');
        data.addRows([
        	 [{v:'${userHead.realname}'}, '', ''],
		<c:forEach items='${allUrlByProject}' var="url"> 
          ['${url.task.userLower.realname}', '${url.task.userUpper.realname}', ''],
          </c:forEach> 
        ]);
        for(var i=0;i<2;i++)
        {
        	var chart = new google.visualization.OrgChart(document.getElementById('chart_div'+(i+1)));
        	chart.draw(data, {allowHtml:true,allowCollapse:true,size:"large"});
        }
        
    }
   </script>
  
     <link rel="stylesheet" type="text/css" href="GoogleChart/css/orgchart.css">
   <style type="text/css">  
body
{
  -moz-user-select:   none;
}
   </style>
    </head>
  <body >

 <center>
 <div style="font-size:33px;margin-top:20px">成员分布图</div>
 <div style="border:1px dashed #000;width:1000px;margin-top:20px"></div>
 </center>
 <table align="center"><tr>
   <td align="left"><div id="container" style="margin-top:40px"></div></td>
   
  <td align="right"><div id="chart_div1" style="margin-top:40px"></div></td>
 </tr>
 </table>
    
    
  </body>
</html>