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
	<!--  <link rel="stylesheet" href="jOrgChart/css/bootstrap.min.css"/>
    <link rel="stylesheet" href="jOrgChart/css/jquery.jOrgChart.css"/>
    <link rel="stylesheet" href="jOrgChart/css/custom.css"/>-->
    <link href="jOrgChart/css/prettify.css" type="text/css" rel="stylesheet" />

  <script type="text/javascript" src="style/js/jquery-1.8.3.min.js"></script>
  <script type="text/javascript" src="style/js/highcharts.js"></script>
  <script type="text/javascript" src="style/js/exporting.js"></script>
  <script type="text/javascript" src="style/js/highcharts-3d.js"></script>
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
<!--  
 <script>
    jQuery(document).ready(function() {
        $("#org").jOrgChart({
            chartElement : '#chart',
            dragAndDrop  : true
        }); 
    });
    </script>
    <script>
        jQuery(document).ready(function() {
            
            /* Custom jQuery for the example */
            $("#show-list").click(function(e){
                e.preventDefault();
                
                $('#list-html').toggle('fast', function(){
                    if($(this).is(':visible')){
                        $('#show-list').text('Hide underlying list.');
                        $(".topbar").fadeTo('fast',0.9);
                    }else{
                        $('#show-list').text('Show underlying list.');
                        $(".topbar").fadeTo('fast',1);                  
                    }
                });
            });
            
            $('#list-html').text($('#org').html());
            
            $("#org").bind("DOMSubtreeModified", function() {
                $('#list-html').text('');
                
                $('#list-html').text($('#org').html());
                
                prettyPrint();                
            });
        });
    </script>
    -->
    
<script type="text/javascript">
fb(1);
</script>
<script type="text/javascript">
  function fb(pageNum){ 
		$("#container").empty();
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
			$("#container").append(str1);
			}
			
			}
		});
  }

</script> 
<style>
body{
width:100%;
height:900px;
margin:0px auto;
}
div{
width:100%;
height:300px;
margin:0px;
}
</style>
  </head>
  
  <body onload="prettyPrint();" sytle="text-aligncenter">
  <div id = "container"></div>
 <!--   <ul id="org" style="display:none;">
 	

   </ul>  
   
    <div id="chart" class="orgChart"></div>
    -->
  </body>
</html>
