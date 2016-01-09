$(function() {
			/*
				设置鼠标进入和离开的JS特效
			*/
			$("#addRoleLink").mouseenter(function() {
				$("#addRoleLink").css("background-color","#F0F8FF");
			});
			$("#addRoleLink").mouseout(function() {
				$("#addRoleLink").css("background-color","");
			});
			$("#listRoleLink").mouseenter(function() {
				$("#listRoleLink").css("background-color","#F0F8FF");
			});
			$("#listRoleLink").mouseout(function() {
				$("#listRoleLink").css("background-color","");
			});
			/*
				点击“添加部门”,局部刷新切换到add.jsp
			*/
			$("#addRoleLink").click(function() {
				var url = "addRolePage.action";
				$("#content").load(url, function() {
					/*
						点击"添加"按钮，进行添加部门
					*/
					$("#addbtn").click(function() {
						var rolename = $("#role-name").val();
						var grade = $("#role-grade").val();
						if("" == rolename || "" == grade) {
							$("#addInfo").html("添加失败！");
							return;
						}
						$.ajax({
							url: "addRole.action",
							cache: false,
							type: "POST",
							data: {
								"role.rolename": rolename,
								"role.grade": grade
							},
							success: function() {
								$("#role-name").val("");
								$("#role-grade").val("");
								$("#addInfo").html("添加成功！");
							}
						});
					});
				});
			});
			
			/*
				点击“部门列表”,局部刷新切换到list.jsp
			*/
			$("#listRoleLink").click(function() {
				var url = "listRolePage.action";
				$("#content").load(url, function() {
//					$("#roleSearch").click(function() {
						var condition = $("#roleCondition").val();
						$.ajax({
							url: "listRole.action",
							cache: false,
							type: "POST",
							data: {
								"condition":condition
							},
							dataType: "json",
							success: function(roles) {
								$("#tableContent").html("");
								if(roles == "") {
									$("#tableContent").append("<tr><td colspan='4' align='center'>查无记录！</td></tr>");
								} else {
									for(var i = 0; i < roles.length; i++) {
										var tdStr = "<tr id='line"+ (i + 1) +"'>";
										$.each(roles[i], function(name, value) {
											tdStr += "<td>" + value + "</td>";
										});
										
										tdStr += "<td>";
										tdStr += "<div class='am-dropdown am-dropdown-up'>";
										tdStr += "<button class='am-btn am-btn-default am-btn-xs am-dropdown-toggle' data-am-dropdown-toggle><span class='am-icon-cog'></span> <span class='am-icon-caret-down'></span></button>";
										tdStr += "<ul class='am-dropdown-content'>";
										tdStr += "<li><a class='updateRole'>1. 编辑</a></li>";
										tdStr += "<li><a class='deleteRole'>2. 删除</a></li>";
										tdStr += "</ul>";
										tdStr += "</div>";
										tdStr += "</td>"; 
										tdStr += "</tr>";
										$("#tableContent").append($(tdStr));
										$(".am-dropdown").dropdown({
											boundary: "window"
										});
									}
									$(".updateRole").on("click", function() {
										var element = $(this).parents("tr");
										var rowId = element.attr("id");
										var id = $(element).children("td").html(); 
										var rolename = $(element).children("td").next().html();
										var grade = $(element).children("td").next().next().html();
										//alert(departName);
										//alert(departDesc);
										//alert(departId);
										$("#roldId").val(id);
										$("#roleName").val(rolename);
										$("#roleGrade").val(grade);
										$("#updateRole").modal({
											relatedElement: this,
											onConfirm: function(data) {
												id = data;
												rolename = $("#roleName").val();
												grade = $("#roleGrade").val();
												$.ajax({
													url: "updateRole.action",
													cache: false,
													type: "POST",
													data: {
														"role.id": id,
														"role.rolename": rolename,
														"role.grade": grade
													},
													dataType: "json",
													success: function(msg) {
														alert(msg);
														parent.location.reload();
													}
												});
										    },
										    onCancel: function() {
										    }
											
										});
									});
									$(".deleteRole").on("click", function() {
										var element = $(this).parents("tr");
										var rowId = element.attr("id");
										var id = $(element).children("td").html();
										$.ajax({
											url: "deleteRole.action",
											cache: false,
											type: "POST",
											data: {
												"role.id": id,
											},
										});
										$("#" + rowId).remove();
									});
								}
							}
						});
						
						
			////////////////////////////////
						$("#roleSearch").click(function() {
							var condition = $("#roleCondition").val();
							$.ajax({
								url: "listRole.action",
								cache: false,
								type: "POST",
								data: {
									"condition":condition
								},
								dataType: "json",
								success: function(roles) {
									$("#tableContent").html("");
									if(roles == "") {
										$("#tableContent").append("<tr><td colspan='4' align='center'>查无记录！</td></tr>");
									} else {
										for(var i = 0; i < roles.length; i++) {
											var tdStr = "<tr id='line"+ (i + 1) +"'>";
											$.each(roles[i], function(name, value) {
												tdStr += "<td>" + value + "</td>";
											});
											
											tdStr += "<td>";
											tdStr += "<div class='am-dropdown am-dropdown-up'>";
											tdStr += "<button class='am-btn am-btn-default am-btn-xs am-dropdown-toggle' data-am-dropdown-toggle><span class='am-icon-cog'></span> <span class='am-icon-caret-down'></span></button>";
											tdStr += "<ul class='am-dropdown-content'>";
											tdStr += "<li><a class='updateRole'>1. 编辑</a></li>";
											tdStr += "<li><a class='deleteRole'>2. 删除</a></li>";
											tdStr += "</ul>";
											tdStr += "</div>";
											tdStr += "</td>"; 
											tdStr += "</tr>";
											$("#tableContent").append($(tdStr));
											$(".am-dropdown").dropdown({
												boundary: "window"
											});
										}
										$(".updateRole").on("click", function() {
											var element = $(this).parents("tr");
											var rowId = element.attr("id");
											var id = $(element).children("td").html(); 
											var rolename = $(element).children("td").next().html();
											var grade = $(element).children("td").next().next().html();
											//alert(departName);
											//alert(departDesc);
											//alert(departId);
											$("#roldId").val(id);
											$("#roleName").val(rolename);
											$("#roleGrade").val(grade);
											$("#updateRole").modal({
												relatedElement: this,
												onConfirm: function(data) {
													id = data;
													rolename = $("#roleName").val();
													grade = $("#roleGrade").val();
													$.ajax({
														url: "updateRole.action",
														cache: false,
														type: "POST",
														data: {
															"role.id": id,
															"role.rolename": rolename,
															"role.grade": grade
														},
														dataType: "json",
														success: function(msg) {
															alert(msg);
															parent.location.reload();
														}
													});
											    },
											    onCancel: function() {
											    }
												
											});
										});
										$(".deleteRole").on("click", function() {
											var element = $(this).parents("tr");
											var rowId = element.attr("id");
											var id = $(element).children("td").html();
											$.ajax({
												url: "deleteRole.action",
												cache: false,
												type: "POST",
												data: {
													"role.id": id,
												},
											});
											$("#" + rowId).remove();
										});
									}
								}
							});
						});
			///////////////////////////////
						
						
					});
//				});
			});
		});