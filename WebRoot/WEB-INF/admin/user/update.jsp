<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<div class="am-modal am-modal-prompt" tabindex="-1" id="updateUser">
	<div class="am-modal-dialog">
		<form class="am-form am-form-horizontal" id="user">
			<div class="am-modal-hd">修改用户</div>
			<div class="am-modal-bd">
				<div class="am-form-group">
					<label for="userId" class="am-u-sm-3 am-form-label">用户编号</label>
					<div class="am-u-sm-9">
						<input class="am-modal-prompt-input" type="text" id="userId"
							placeholder="用户编号" readonly="readonly">
					</div>
				
					<label for="userName" class="am-u-sm-3 am-form-label">用户帐号</label>
					<div class="am-u-sm-9">
						<input class="am-modal-prompt-input" type="text" id="userName"
							placeholder="用户帐号">
					</div>
				
					<label for="userPassword" class="am-u-sm-3 am-form-label">用户密码</label>
					<div class="am-u-sm-9">
						<input class="am-modal-prompt-input" type="text" id="userPassword"
							placeholder="用户密码">
					</div>
				
					<label for="userRealname" class="am-u-sm-3 am-form-label">真实姓名</label>
					<div class="am-u-sm-9">
						<input class="am-modal-prompt-input" type="text" id="userRealname"
							placeholder="真实姓名">
					</div>
				
					<label for="userSex" class="am-u-sm-3 am-form-label">性别</label>
					<div class="am-u-sm-9">
						<input class="am-modal-prompt-input" type="text" id="userSex"
							placeholder="性别"> 
						
						<%-- <select id="userSex" placeholder="性别">
							<option selected="selected" name="userSex">${userSex }</option>
							<option value="男">男(1)</option>
							<option value="女">女(2)</option>
						</select> --%>
					</div>
				
					<label for="userRolename" class="am-u-sm-3 am-form-label">角&nbsp;&nbsp;色</label>
					<div class="am-u-sm-9">
						<span style="visibility:hidden" id="userRoleId"></span>
						<input class="am-modal-prompt-input" type="text" id="userRolename"
							placeholder="角色" readonly="readonly"> 
					</div>
			
					<label for="userDepartment" class="am-u-sm-3 am-form-label">部&nbsp;&nbsp;门</label>
					<div class="am-u-sm-9">
						<span style="visibility:hidden" id="userDepartmentId"></span>
						<input class="am-modal-prompt-input" type="text" id="userDepartment"
							placeholder="部门" readonly="readonly"> 
					</div>
			</div>
			<div class="am-modal-footer">
				<span class="am-modal-btn" data-am-modal-cancel>取消</span> <span
					class="am-modal-btn" data-am-modal-confirm>保存修改</span>
			</div>
		</form>
	</div>
</div>