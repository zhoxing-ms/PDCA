<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'TestLoad.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<!-- Google Ajax Lib Script -->    
    <script src="http://www.google.com/jsapi" type="text/javascript"></script>  
    <!-- Inline Code -->    
    <script type="text/javascript">  

 
            google.load("visualization", "1", {packages:["orgchart"]}); 
            google.setOnLoadCallback(function() { 
                alert(document.getElementsByTagName("script").length); 
                document.getElementById("t").innerHTML += (new Date()).getTime(); 
            }); 
 
            google.load("maps","2"); 
            google.setOnLoadCallback(function() { 
                alert(document.getElementsByTagName("script").length); 
                document.getElementById("t").innerHTML += (new Date()).getTime(); 
            }); 

    </script>  
</head>  
<body>  
<div id="t">  
      
</div>  
</body>  
</html>
