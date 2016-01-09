<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'TestJson.jsp' starting page</title>  
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<script type="text/javascript" src="style/js/jquery-1.8.3.min.js"></script>
  <script type="text/javascript" src="style/js/highcharts.js"></script>
  <script type="text/javascript" src="style/js/exporting.js"></script>
 <!--   <script type="text/javascript" src="style/js/highcharts-3d.js"></script>-->
<script type="text/javascript">
﻿$(function nu() {
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
    
    var browserData = [];
    var versionsData = [];
    var j = 2,k=2;
    if (data.p1 != null) {
                 	$.each(data.p1, function (i,d) {
                 	
                   	  browserData.push([d.realname,d.per,colors[4]]);
                   	  j++;
                   	  //versionsData.push([d[0].p2[0].Finished,d[0].p2[0].per,colors[j]]);
                   	 	if(d.p2!=null){
                   	 		$.each(d.p2,function(i,d){
                   	 			versionsData.push([d.Finished,d.per,colors[4]]);
                   	 			k++;
                   	 		});
                   	 	}
                 	});
             	}
             
    // Create the chart
    $('#container').highcharts({
        chart: {
            type: 'pie'
        },
        title: {
            text: ''+data.projectname
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
});
}
});
})
</script>
<script type="text/javascript">
 
  $(function(){
 nu(4);
 nu(5);
});
  </script>
<style>
body{
width:100%;
height:300px;
margin:0px auto;
}
#container{
width:100%;
height:300px;
margin:0px;
}
</style>
  </head>
  
  <body>
    <div id="container"></div>
  </body>
</html>
