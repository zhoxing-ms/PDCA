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
			<strong class="am-text-primary am-text-lg">部门管理</strong> / <small>添加部门</small>
		</div>
	</div>

	<hr>

	<div class="am-g">
		<div class="am-u-sm-12 am-u-sm-centered">
			<form class="am-form am-form-horizontal" id="department">
				<div class="am-form-group">
					<label for="department-name" class="am-u-sm-3 am-form-label">部门名称</label>
					<div class="am-u-sm-9">
						<input type="text" id="department-name" placeholder="部门名称">
						<small>输入部门名称。</small>
					</div>
				</div>

				<div class="am-form-group">
					<label for="department-desc" class="am-u-sm-3 am-form-label">部门描述</label>
					<div class="am-u-sm-9">
						<input type="text" id="department-desc" placeholder="部门描述">
						<small>输入部门描述。</small>
					</div>
				</div>
				<div class="am-form-group">
					<div class="am-u-sm-9 am-u-sm-push-3">
						<button type="button" class="am-btn am-btn-primary"  data-am-modal="{target: '#addDepartment-alert'}" id="addbtn">添加</button>
						<div class="am-modal am-modal-alert" tabindex="-1" id="addDepartment-alert">
							<div class="am-modal-dialog">
								<div class="am-modal-hd">添加 成功！</div>
								<div class="am-modal-footer">
									<span class="am-modal-btn">确定</span>
								</div>
							</div>
						</div>
					</div>
				</div>
			</form>
		</div>
	</div>
</div>
