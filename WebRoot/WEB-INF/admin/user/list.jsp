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
			<strong class="am-text-primary am-text-lg">用户管理</strong> / <small>用户列表</small>
		</div>
	</div>

	<hr>
	
	<!-- 用户搜索 -->
	<div class="am-u-sm-6 am-center">
		<div class="am-input-group am-input-group-primary">
			<span class="am-input-group-btn">
				<button class="am-btn am-btn-primary" type="button"
					id="userSearch">
					<span class="am-icon-search"></span>
				</button>
			</span> <input id="userCondition" type="text" class="am-form-field" placeholder="输入查询的用户名称">
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
					<th>用户编号</th>
					<th>用户帐号</th>
					<th>用户密码</th>
					<th>真实姓名</th>
					<th>性别</th>
					<th>角色</th>
					<th>部门</th>
					<th>管理</th>
				</tr>
			</thead>
			<tbody id="tableContent">
			</tbody>
		</table>
	</div>
</div>
