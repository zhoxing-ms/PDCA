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
    <script type="text/javascript" src="GoogleChart/js/jsapi.js"></script>
    <script type="text/javascript" src="style/js/jquery-1.8.3.min.js"></script>
  <script type="text/javascript" src="style/js/highcharts.js"></script>
  <script type="text/javascript" src="style/js/exporting.js"></script>
  <link rel="stylesheet" type="text/css" href="GoogleChart/css/orgchart.css">
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
			    					parent.appendChild(div);
			    				}
			    				
			      				for(var i = 0;i<jsonList.length;i++){
			      					var browserData = [];
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
 width:70%;
 height:280px;
 margin:0px;
 float:left;
}
#container1{
 width:70%;
 height:280px;
 margin:0px;
 float:left;
  
}
#container div{
 width:100%;
 height:280px;
 margin:0px;
 float:left;

}
#chart_div{
 width:30%;
 height:280px;
 margin:0px auto;
 float:left;
  line-height:30px;
}
#chart_div div{
width:100%;
 height:280px;
margin:0px auto;
 line-height:30px;
}
   </style>
    </head>
  <body >

 <center>
 <div style="font-size:33px;margin-top:20px">未完成成员分布图</div>
 <div style="border:1px dashed #000;width:1000px;margin-top:20px"></div>
   <div id="container" ></div>
   <div id="chart_div" style="margin-top:60px"></div>
   <div>
   <a href="#" >下一页</a>
   <a href="#" >上一页</a>
   <a href="#" >尾页</a>
   <a href="#" >首页</a>
   </div>
 </center>
    
    
  </body>
</html>