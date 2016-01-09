<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<script type="text/javascript">
	function checkFileForm() {
		var fileData = $("#document-attach").val();
		if(fileData == "")
			return false;
		return true;
	}
</script>
<div class="admin-content">
	<div class="am-cf am-padding">
		<div class="am-fl am-cf">
			<strong class="am-text-primary am-text-lg">文档管理</strong> / <small>添加文档</small>
		</div>
	</div>

	<hr>

	<div class="am-g">
		<div class="am-u-sm-12 am-u-sm-centered">
			<form action="uploadDocument.action" method="post"  enctype="multipart/form-data" class="am-form am-form-horizontal" id="document">

				<div class="am-form-group">
					<label for="document-type" class="am-u-sm-3 am-form-label">文档类型</label>
					<div class="am-u-sm-9">
						<select id="document-type" name="fileType">
							<option value="P">P</option>
							<option value="D">D</option>
							<option value="C">C</option>
							<option value="A">A</option>
						</select>
					</div>
				</div>
				
				<div class="am-form-group">
					<label for="document-attach" class="am-u-sm-3 am-form-label">附件</label>
					<div class="am-u-sm-9">
						<input type="file" id="document-attach" name="fileUpload">
						<small>请选择要上传的文档。</small>
					</div>
				</div>
				
				<div class="am-form-group">
					<div class="am-u-sm-9 am-u-sm-push-3">
						<button type="submit" class="am-btn am-btn-primary"  data-am-modal="{target: '#addDocument-alert'}" id="addbtn" onclick="return checkFileForm();">添加</button>
						<!-- <div class="am-modal am-modal-alert" tabindex="-1" id="addDocument-alert">
							<div class="am-modal-dialog">
								<div class="am-modal-hd">添加 成功！</div>
								<div class="am-modal-footer">
									<span class="am-modal-btn">确定</span>
								</div>
							</div>
						</div> -->
					</div>
				</div>
			</form>
		</div>
	</div>
</div>

