<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<div class="admin-content">

	<div class="am-cf am-padding">
		<div class="am-fl am-cf">
			<strong class="am-text-primary am-text-lg">文档管理</strong> / <small>文档列表</small>
		</div>
	</div>

	<hr>
	
	<!-- 文档搜索 -->
	<div class="am-u-sm-6 am-center">
		<div class="am-input-group am-input-group-primary">
			<span class="am-input-group-btn">
				<button class="am-btn am-btn-primary" type="button"
					id="documentSearch">
					<span class="am-icon-search"></span>
				</button>
			</span> <input id="documentCondition" type="text" class="am-form-field" placeholder="输入查询的文档名称">
		</div>
	</div>

</div>

<hr>

<div class="am-g">
	<div class="am-u-sm-12" id="tableDiv">
		<table
			class="am-table am-table-bd am-table-striped admin-content-table">
			<thead>
				<tr>
					<th>文档编号</th>
					<th>文档名称</th>
					<th>文档类型</th>
					<th>管理</th>
				</tr>
			</thead>
			<tbody id="tableContent">
			</tbody>
		</table>
	</div>
</div>
