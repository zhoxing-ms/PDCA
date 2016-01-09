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
			<strong class="am-text-primary am-text-lg">用户管理</strong> / <small>添加用户</small>
		</div>
	</div>

	<hr>

	<div class="am-g">
		<img alt="" id="loading" src="style/i/loading.gif" style="display:none">
		<div class="am-u-sm-12 am-u-sm-centered">
			<form class="am-form am-form-horizontal" id="User">
				<div class="am-form-group">
					<label for="user-username" class="am-u-sm-3 am-form-label">用户帐号</label>
					<div class="am-u-sm-9">
						<input type="text" id="user-username" placeholder="用户帐号" value=""> <small>输入用户帐号。</small>
					</div>
				</div>

				<div class="am-form-group">
					<label for="user-password" class="am-u-sm-3 am-form-label">用户密码</label>
					<div class="am-u-sm-9">
						<input type="password" id="user-password" placeholder="用户密码" value="">
						<small>输入用户密码。</small>
					</div>
				</div>

				<div class="am-form-group">
					<label for="user-realname" class="am-u-sm-3 am-form-label">真实姓名</label>
					<div class="am-u-sm-9">
						<input type="text" id="user-realname" placeholder="真实姓名">
						<small>输入真实姓名。</small>
					</div>
				</div>

				<div class="am-form-group">
					<label for="user-sex" class="am-u-sm-3 am-form-label">性&nbsp;&nbsp;别</label>
					<div class="am-u-sm-9">
						<!-- <input type="text" id="user-sex" placeholder="性别"> --> 
						<select id="user-sex">
							<option selected="selected" value="1">男</option>
							<option value="2">女</option>
						</select><span class="am-form-caret"></span>
						<small>请选择性别。</small>
					</div>
				</div>

				<div class="am-form-group">
					<label for="user-department" class="am-u-sm-3 am-form-label">部&nbsp;&nbsp;门</label>
					<div class="am-u-sm-9">
						<select id="user-department">
							<option value="">选择部门</option>
						</select> <span class="am-form-caret"></span>
						<small>请选择部门。</small>
					</div>
				</div>
				
				<div class="am-form-group">
					<label for="user-role" class="am-u-sm-3 am-form-label">角&nbsp;&nbsp;色</label>
					<div class="am-u-sm-9">
						<select id="user-role">
							<option value="">选择角色</option>
						</select> <span class="am-form-caret"></span>
						<small>请选择角色。</small>
					</div>
				</div>
				<div class="am-form-group">
					<div class="am-u-sm-9 am-u-sm-push-3">
						<button type="button" class="am-btn am-btn-primary"
							data-am-modal="{target: '#addUser-alert'}" id="addbtn">添加</button>
						<input
						type="reset" value="重置"
						class="am-btn am-btn-primary am-fr" />
						
						<div class="am-modal am-modal-alert" tabindex="-1"
							id="addUser-alert">
							<div class="am-modal-dialog">
								<div class="am-modal-hd" id="addInfo">添加 成功！</div>
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
