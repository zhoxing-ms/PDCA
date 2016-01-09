<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<div class="am-modal am-modal-prompt" tabindex="-1" id="updateRole">
	<div class="am-modal-dialog">
		<form class="am-form am-form-horizontal" id="department">
			<div class="am-modal-hd">修改角色</div>
			<div class="am-modal-bd">
				<div class="am-form-group">
					<label for="roldId" class="am-u-sm-3 am-form-label">角色编号</label>
					<div class="am-u-sm-9">
						<input class="am-modal-prompt-input" type="text" id="roldId"
							placeholder="角色编号" readonly="readonly">
					</div>
				</div>
			</div>
			<div class="am-modal-bd">
				<div class="am-form-group">
					<label for="roleName" class="am-u-sm-3 am-form-label">角色名称</label>
					<div class="am-u-sm-9">
						<input class="am-modal-prompt-input" type="text" id="roleName"
							placeholder="角色名称"> <small>输入角色名称。</small>
					</div>
				</div>
			</div>
			<div class="am-modal-bd">
				<div class="am-form-group">
					<label for="roleGrade" class="am-u-sm-3 am-form-label">权限级别</label>
					<div class="am-u-sm-9">
						<input class="am-modal-prompt-input" type="text" id="roleGrade"
							placeholder="权限级别"> <small>输入权限级别。</small>
					</div>
				</div>
			</div>
			<div class="am-modal-footer">
				<span class="am-modal-btn" data-am-modal-cancel>取消</span> <span
					class="am-modal-btn" data-am-modal-confirm>保存修改</span>
			</div>
		</form>
	</div>
</div>