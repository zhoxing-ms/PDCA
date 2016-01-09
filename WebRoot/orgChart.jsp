<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!--èµææ¥æº  http://www.oschina.net/code/snippet_1864890_38911 -->
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html><head><meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>jOrgChart - A jQuery OrgChart Plugin</title>
    <link rel="stylesheet" href="jOrgChart/css/bootstrap.min.css"/>
    <link rel="stylesheet" href="jOrgChart/css/jquery.jOrgChart.css"/>
    <link rel="stylesheet" href="jOrgChart/css/custom.css"/>
    <link href="jOrgChart/css/prettify.css" type="text/css" rel="stylesheet" />

    <script type="text/javascript" src="jOrgChart/js/prettify.js"></script>
    
    <!-- jQuery includes -->
    <script type="text/javascript" src="jOrgChart/js/jquery.min.js"></script>
    <script type="text/javascript" src="jOrgChart/js/jquery-ui.min.js"></script>
    
  <script type="text/javascript" src="style/js/highcharts.js"></script>
  <script type="text/javascript" src="style/js/exporting.js"></script>
    <script src="jOrgChart/js/jquery.jOrgChart.js"></script>

    <script>
    $(function () {
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
    var parentChart = document.getElementById("orgChart");
    for(var i=0;i<data.projectnumber;i++){
    	var div = document.createElement("div");
    	div.setAttribute("id","container"+(i+1));
    	var orgdiv = document.createElement("div");
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
    jQuery(document).ready(function() {
        $("#org").jOrgChart({
            chartElement : '#chart',
            dragAndDrop  : true
        }); 
    });
     jQuery(document).ready(function() {
        $("#org1").jOrgChart({
            chartElement : '#chart',
            dragAndDrop  : true
        }); 
    });
    jQuery(document).ready(function() {
        $("#org2").jOrgChart({
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
  <style>
body{
width:100%;
height:900px;
margin:0px auto;
}
#container{
width:50%;
float:left;
height:100px;
margin:0px;
}
</style>
  </head>

  <body  sytle="text-aligncenter">
  <!-- 绘制饼图 -->
  
    <div id = "container"></div>   
  <div id="orgchart" style=" float:left;">
 <!-- 绘制组织结构图 -->
     <ul id="org" style="display:none;">
 	
 	<% 
 		
 			String s = (String)session.getAttribute("my"+1);
 			out.write(s);
 		
 	%>
   </ul>  
    <ul id="org1" style="display:none;">
   <% 
 		
 			String s1 = (String)session.getAttribute("my"+2);
 			out.write(s1);
 		
 	%>
   </ul>
   <ul id="org2" style="display:none;">
   <% 
 		
 			String s2 = (String)session.getAttribute("my"+3);
 			out.write(s2);
 		
 	%>
   </ul>
    <div id="chart" class="orgChart"></div>
    </div>
</body>
</html>