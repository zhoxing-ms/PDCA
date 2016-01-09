<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<div class="am-modal am-modal-prompt" tabindex="-1" id="updatePage">
	<div class="am-modal-dialog">
		<form class="am-form am-form-horizontal" id="department">
			<div class="am-modal-hd">修改部门</div>
			<div class="am-modal-bd">
				<div class="am-form-group">
					<label for="departId" class="am-u-sm-3 am-form-label">部门编号</label>
					<div class="am-u-sm-9">
						<input class="am-modal-prompt-input" type="text" id="departId"
							placeholder="部门编号" readonly="readonly">
					</div>
				</div>
			</div>
			<div class="am-modal-bd">
				<div class="am-form-group">
					<label for="departName" class="am-u-sm-3 am-form-label">部门名称</label>
					<div class="am-u-sm-9">
						<input class="am-modal-prompt-input" type="text" id="departName"
							placeholder="部门名称"> <small>输入部门名称。</small>
					</div>
				</div>
			</div>
			<div class="am-modal-bd">
				<div class="am-form-group">
					<label for="departDesc" class="am-u-sm-3 am-form-label">部门描述</label>
					<div class="am-u-sm-9">
						<input class="am-modal-prompt-input" type="text" id="departDesc"
							placeholder="部门描述"> <small>输入部门描述。</small>
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