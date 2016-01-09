<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'TestOrgChart.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
 <script type="text/javascript" src="GoogleChart/js/jsapi.js"></script>
  <link rel="stylesheet" type="text/css" href="GoogleChart/css/orgchart.css">
  <script type="text/javascript">
google.load("visualization", "1", {packages:["orgchart"]}); 
google.setOnLoadCallback(drawChart);
      function drawChart() {
        var data = new google.visualization.DataTable();
        data.addColumn('string', 'Name');
        data.addColumn('string', 'Manager');
        data.addColumn('string', 'ToolTip');

        data.addRows([
            ['<a href="performPage.action?projectId=4">Mike</a>','<a href="performPage.action?projectId=4">Mike</a>',  'The President'],
          ['<a href="performPage.action?projectId=4">Jim</a>', '<a href="performPage.action?projectId=4">Mike</a>', 'VP'],
          ['<a href="performPage.action?projectId=4">Alice</a>', '<a href="performPage.action?projectId=4">Mike</a>', ''],
          ['<a href="performPage.action?projectId=4">Bob</a>', '<a href="performPage.action?projectId=4">Jim</a>', 'Bob Sponge'],
          ['Carol', '<a href="performPage.action?projectId=4">Bob</a>', '']
        ]);

        var chart = new google.visualization.OrgChart(document.getElementById('chart_div'));
        chart.draw(data, {allowHtml:true});
      }
  </script>
  </head>
  
  <body>
   <div id="chart_div"></div>
  </body>
</html>
