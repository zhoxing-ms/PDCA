<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!doctype html>
<html class="no-js">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>后台管理页面</title>
<meta name="description" content="这是一个 index 页面">
<meta name="keywords" content="index">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<meta name="renderer" content="webkit">
<meta http-equiv="Cache-Control" content="no-siteapp" />
<link rel="apple-touch-icon-precomposed"
	href="style/i/app-icon72x72@2x.png">
<meta name="apple-mobile-web-app-title" content="Amaze UI" />
<link rel="stylesheet" href="style/css/amazeui.min.css" />
<link rel="stylesheet" href="style/css/admin.css">
</head>
<body>
	<!--[if lte IE 9]>
<p class="browsehappy">你正在使用<strong>过时</strong>的浏览器，Amaze UI 暂不支持。 请 <a href="http://browsehappy.com/" target="_blank">升级浏览器</a>
  以获得更好的体验！</p>
<![endif]-->
	<!-- 包含页面的头部 -->
	<jsp:include page="../admin/admin-header.jsp"></jsp:include>
	<div class="am-cf admin-main">
		<!-- 左边的导航栏 -->
		<jsp:include page="../admin/admin-left.jsp"></jsp:include>
		<!-- content start -->
		<div class="admin-content" id="content">

			<div class="am-cf am-padding">
				<div class="am-fl am-cf">
					<strong class="am-text-primary am-text-lg">首页</strong> / <small>用户须知</small>
				</div>
			</div>

			<hr>

			<div class="am-g">
				<div class="am-u-sm-12 am-u-sm-centered">
					<h2>PDCA系统介绍</h2>
					<p>PDCA系统具体介绍。</p>
				</div>
			</div>

		</div>
		<!-- content end -->
		<jsp:include page="../admin/department/update.jsp"></jsp:include>
		<jsp:include page="../admin/role/update.jsp"></jsp:include>
		<jsp:include page="../admin/user/update.jsp"></jsp:include>
	</div>

	<!-- 页脚 -->
	<%-- <jsp:include page="admin-footer.jsp"></jsp:include> --%>

	<!--[if lt IE 9]>
<script src="http://libs.baidu.com/jquery/1.11.1/jquery.min.js"></script>
<script src="http://cdn.staticfile.org/modernizr/2.8.3/modernizr.js"></script>
<script src="assets/js/polyfill/rem.min.js"></script>
<script src="assets/js/polyfill/respond.min.js"></script>
<script src="assets/js/amazeui.legacy.js"></script>
<![endif]-->

	<!--[if (gte IE 9)|!(IE)]><!-->
	<script src="style/js/jquery.min.js"></script>
	<script src="style/js/amazeui.min.js"></script>
	<script src="style/js/jquery.blockUI.js"></script>
	<!--<![endif]-->
	<script src="style/js/app.js"></script>
	<script type="text/javascript" src="style/js/department/department.js"></script>
	<script type="text/javascript" src="style/js/role/role.js"></script>	
	<script type="text/javascript" src="style/js/user/user.js"></script>	
	<script type="text/javascript" src="style/js/doc/doc.js"></script>
</body>
</html>
