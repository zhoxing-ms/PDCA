<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!-- sidebar start -->
<div class="admin-sidebar">
	<ul class="am-list admin-sidebar-list">
		<li><a href="javascript:void(0)" onclick="history.go(0)"><span class="am-icon-home"></span>
				首页</a></li>
		<li class="admin-parent">
			<a class="am-cf" data-am-collapse="{target: '#collapse-nav1'}">
				<span class="am-icon-file"></span> 部门管理 
				<span class="am-icon-angle-right am-fr am-margin-right"></span>
			</a>
			<ul class="am-list am-collapse admin-sidebar-sub am-in" id="collapse-nav1">
				<li>
					<a id="addDepartLink"><span class="am-icon-check"></span> 添加部门 </a>
				</li>
				<li>
					<a id="listDepartLink"><span class="am-icon-check"></span> 部门列表</a>
				</li>
			</ul>
		</li>
		<li class="admin-parent"><a class="am-cf"
			data-am-collapse="{target: '#collapse-nav2'}"><span
				class="am-icon-file"></span> 角色管理 <span
				class="am-icon-angle-right am-fr am-margin-right"></span></a>
			<ul class="am-list am-collapse admin-sidebar-sub am-in"
				id="collapse-nav2">
				<li><a id="addRoleLink"><span
						class="am-icon-check"></span> 添加角色</a></li>
				<li><a id="listRoleLink"><span
						class="am-icon-check"></span> 角色列表</a></li>
			</ul></li>
		<li class="admin-parent"><a class="am-cf"
			data-am-collapse="{target: '#collapse-nav3'}"><span
				class="am-icon-file"></span> 用户管理 <span
				class="am-icon-angle-right am-fr am-margin-right"></span></a>
			<ul class="am-list am-collapse admin-sidebar-sub am-in"
				id="collapse-nav3">
				<li><a id="addUserLink"><span
						class="am-icon-check"></span> 添加用户</a></li>
				<li><a id="listUserLink"><span
						class="am-icon-check"></span> 用户列表</a></li>
			</ul></li>
		<li class="admin-parent"><a class="am-cf"
			data-am-collapse="{target: '#collapse-nav3'}"><span
				class="am-icon-file"></span> 文档管理 <span
				class="am-icon-angle-right am-fr am-margin-right"></span></a>
			<ul class="am-list am-collapse admin-sidebar-sub am-in"
				id="collapse-nav3">
				<li><a id="addDocumentLink"><span
						class="am-icon-check"></span> 添加文档</a></li>
				<li><a id="listDocumentLink"><span
						class="am-icon-check"></span> 文档列表</a></li>
			</ul></li>
		<li><a href="userExit.action"><span class="am-icon-sign-out"></span> 注销</a></li>
	</ul>

</div>
<!-- sidebar end -->
