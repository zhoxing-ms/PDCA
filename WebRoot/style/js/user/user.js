$(function() {
			/*
				设置鼠标进入和离开的JS特效
			*/
			$("#addUserLink").mouseenter(function() {
				$("#addUserLink").css("background-color","#F0F8FF");
			});
			$("#addUserLink").mouseout(function() {
				$("#addUserLink").css("background-color","");
			});
			$("#listUserLink").mouseenter(function() {
				$("#listUserLink").css("background-color","#F0F8FF");
			});
			$("#listUserLink").mouseout(function() {
				$("#listUserLink").css("background-color","");
			});
			/*
				点击“添加用户”,局部刷新切换到add.jsp
			*/
			$("#addUserLink").click(function() {
				var url = "addUserPage.action";
				$("#content").load(url, function() {
					$(document).ajaxStart(function(){
						$.blockUI({
							message: $('#loading'), 
				            css: { 
				                top:  ($(window).height() - 400) /2 + 'px', 
				                left: ($(window).width() - 400) /2 + 'px', 
				                width: '400px', 
				                border: 'none',
				            },
							overlayCSS: { backgroundColor: 'gray' }
						});
					}).ajaxStop($.unblockUI);
					$("#user-department").focus(function() {
						$("#user-department option:not(:first)").remove();
						$.ajax({
							url: "listDepart.action",
							cache: false,
							type: "POST",
							data: {
								"condition":""
							},
							dataType: "json",
							success: function(departments) {
								for(var i = 0; i < departments.length; i++) {
									var departId = departments[i].departId;
									var departName = departments[i].departName;
									$("#user-department").append("<option value='" + departId + "'>" + departName + "</option>");
								}
							}
						});
					});
					
					$("#user-role").focus(function() {
						$("#user-role option:not(:first)").remove();
						$.ajax({
							url: "listRole.action",
							cache: false,
							type: "POST",
							data: {
								"condition":""
							},
							dataType: "json",
							success: function(roles) {
								for(var i = 0; i < roles.length; i++) {
									var id = roles[i].id;
									var rolename = roles[i].rolename;
									$("#user-role").append("<option value='" + id + "'>" + rolename + "</option>");
								}
							}
						});
					});
					/*
						点击"添加"按钮，进行添加用户
					*/
					$("#addbtn").click(function() {
						var username = $("#user-username").val();
						var password = $("#user-password").val();
						var realname = $("#user-realname").val();
						var sex = $("#user-sex").val();
						var dep_id = $("#user-department").val();
						var role_id = $("#user-role").val();
						if("" == username || "" == password || "" == realname || "" == sex
								|| "" == dep_id || "" == role_id) {
							$("#addInfo").html("添加失败！");
							return;
						}
						$.ajax({
							url: "addUsers.action",
							cache: false,
							type: "POST",
							data: {
								"user.username": username,
								"user.password": password,
								"user.realname": realname,
								"user.sex" : sex,
								"user.department.departId": dep_id,
								"user.role.id": role_id
							},
							success: function() {
								$("#user-username").val("");
								$("#user-password").val("");
								$("#user-realname").val("");
								$("#user-sex").val("");
								$("#user-department").val("");
								$("#user-role").val("");
								$("#addInfo").html("添加成功！");
							}
						});
					});
				});
			});
			
			/*
				点击“部门列表”,局部刷新切换到list.jsp
			*/
			$("#listUserLink").click(function() {
				var url = "listUserPage.action";
				$("#content").load(url, function() {
//					$("#userSearch").click(function() {
						var condition = $("#userCondition").val();
						$.ajax({
							url: "listUsers.action",
							cache: false,
							type: "POST",
							data: {
								"condition":condition
							},
							dataType: "json",
							success: function(users) {
								$("#tableContent").html("");
								if(users == "") {
									$("#tableContent").append("<tr><td colspan='4' align='center'>查无记录！</td></tr>");
								} else {
									for(var i = 0; i < users.length; i++) {
										var tdStr = "<tr id='line"+ (i + 1) +"'>";
										$.each(users[i], function(name, value) {
											if(name == "department") {
												tdStr += "<td><span style='visibility:hidden'>" + value.departId + "</span><span>" + value.departName + "</span></td>";
											} else if(name == "role") {
												tdStr += "<td><span style='visibility:hidden'>" + value.id + "</span><span>" + value.rolename + "</span></td>";
											} else {
												tdStr += "<td>" + value + "</td>";
											}
										});
										
										tdStr += "<td>";
										tdStr += "<div class='am-dropdown am-dropdown-up'>";
										tdStr += "<button class='am-btn am-btn-default am-btn-xs am-dropdown-toggle' data-am-dropdown-toggle><span class='am-icon-cog'></span> <span class='am-icon-caret-down'></span></button>";
										tdStr += "<ul class='am-dropdown-content'>";
										tdStr += "<li><a class='updateUser'>1. 编辑</a></li>";
										tdStr += "<li><a class='deleteUser'>2. 删除</a></li>";
										tdStr += "</ul>";
										tdStr += "</div>";
										tdStr += "</td>"; 
										tdStr += "</tr>";
										$("#tableContent").append($(tdStr));
										$(".am-dropdown").dropdown({
											boundary: "window"
										});
									}
									$(".updateUser").on("click", function() {
										var element = $(this).parents("tr");
										var rowId = element.attr("id");
										var id = $(element).children("td").html(); 
										var username = $(element).children("td").next().html();
										var password = $(element).children("td").next().next().html();
										var realname = $(element).children("td").next().next().next().html();
										var sex = $(element).children("td").next().next().next().next().html();
										var roleId = $(element).children("td").next().next().next().next().next().children("span:nth-child(1)").html();
										var roleName = $(element).children("td").next().next().next().next().next().children("span:nth-child(2)").html();
										var departmentId = $(element).children("td").next().next().next().next().next().next().children("span:nth-child(1)").html();
										var departmentName = $(element).children("td").next().next().next().next().next().next().children("span:nth-child(2)").html();
										/*alert(id);
										alert(username);
										alert(password);
										alert(realname);
										alert(sex);
										alert(roleId);
										alert(roleName);
										alert(departmentId);
										alert(departmentName);*/
										$("#userId").val(id);
										$("#userName").val(username);
										$("#userPassword").val(password);
										$("#userRealname").val(realname);
										$("#userSex").val(sex);
										$("#userRoleId").val(roleId);
										$("#userRolename").val(roleName);
										$("#userDepartmentId").val(departmentId);
										$("#userDepartment").val(departmentName);
										$("#updateUser").modal({
											relatedElement: this,
											onConfirm: function(data) {
												id = data;
												username = $("#userName").val();
												password = $("#userPassword").val();
												realname = $("#userRealname").val();
												sex = $("#userSex").val();
												roleId = $("#userRoleId").val();
												roleName = $("#userRolename").val();
												departmentId = $("#userDepartmentId").val();
												departmentName = $("#userDepartment").val();
												$.ajax({
													url: "updateUsers.action",
													cache: false,
													type: "POST",
													data: {
														"user.id": id,
														"user.username": username,
														"user.password": password,
														"user.realname": realname,
														"user.sex" : sex,
														"user.department.departId": departmentId,
														"user.role.id": roleId
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
									$(".deleteUser").on("click", function() {
										var element = $(this).parents("tr");
										var rowId = element.attr("id");
										var id = $(element).children("td").html();
										$.ajax({
											url: "deleteUsers.action",
											cache: false,
											type: "POST",
											data: {
												"user.id": id,
											},
										});
										$("#" + rowId).remove();
									});
								}
							}
						});
						
				////////////////////////////////
						$("#userSearch").click(function() {
							var condition = $("#userCondition").val();
							$.ajax({
								url: "listUsers.action",
								cache: false,
								type: "POST",
								data: {
									"condition":condition
								},
								dataType: "json",
								success: function(users) {
									$("#tableContent").html("");
									if(users == "") {
										$("#tableContent").append("<tr><td colspan='4' align='center'>查无记录！</td></tr>");
									} else {
										for(var i = 0; i < users.length; i++) {
											var tdStr = "<tr id='line"+ (i + 1) +"'>";
											$.each(users[i], function(name, value) {
												if(name == "department") {
													tdStr += "<td><span style='visibility:hidden'>" + value.departId + "</span><span>" + value.departName + "</span></td>";
												} else if(name == "role") {
													tdStr += "<td><span style='visibility:hidden'>" + value.id + "</span><span>" + value.rolename + "</span></td>";
												} else {
													tdStr += "<td>" + value + "</td>";
												}
											});
											
											tdStr += "<td>";
											tdStr += "<div class='am-dropdown am-dropdown-up'>";
											tdStr += "<button class='am-btn am-btn-default am-btn-xs am-dropdown-toggle' data-am-dropdown-toggle><span class='am-icon-cog'></span> <span class='am-icon-caret-down'></span></button>";
											tdStr += "<ul class='am-dropdown-content'>";
											tdStr += "<li><a class='updateUser'>1. 编辑</a></li>";
											tdStr += "<li><a class='deleteUser'>2. 删除</a></li>";
											tdStr += "</ul>";
											tdStr += "</div>";
											tdStr += "</td>"; 
											tdStr += "</tr>";
											$("#tableContent").append($(tdStr));
											$(".am-dropdown").dropdown({
												boundary: "window"
											});
										}
										$(".updateUser").on("click", function() {
											var element = $(this).parents("tr");
											var rowId = element.attr("id");
											var id = $(element).children("td").html(); 
											var username = $(element).children("td").next().html();
											var password = $(element).children("td").next().next().html();
											var realname = $(element).children("td").next().next().next().html();
											var sex = $(element).children("td").next().next().next().next().html();
											var roleId = $(element).children("td").next().next().next().next().next().children("span:nth-child(1)").html();
											var roleName = $(element).children("td").next().next().next().next().next().children("span:nth-child(2)").html();
											var departmentId = $(element).children("td").next().next().next().next().next().next().children("span:nth-child(1)").html();
											var departmentName = $(element).children("td").next().next().next().next().next().next().children("span:nth-child(2)").html();
											/*alert(id);
											alert(username);
											alert(password);
											alert(realname);
											alert(sex);
											alert(roleId);
											alert(roleName);
											alert(departmentId);
											alert(departmentName);*/
											$("#userId").val(id);
											$("#userName").val(username);
											$("#userPassword").val(password);
											$("#userRealname").val(realname);
											$("#userSex").val(sex);
											$("#userRoleId").val(roleId);
											$("#userRolename").val(roleName);
											$("#userDepartmentId").val(departmentId);
											$("#userDepartment").val(departmentName);
											$("#updateUser").modal({
												relatedElement: this,
												onConfirm: function(data) {
													id = data;
													username = $("#userName").val();
													password = $("#userPassword").val();
													realname = $("#userRealname").val();
													sex = $("#userSex").val();
													roleId = $("#userRoleId").val();
													roleName = $("#userRolename").val();
													departmentId = $("#userDepartmentId").val();
													departmentName = $("#userDepartment").val();
													$.ajax({
														url: "updateUsers.action",
														cache: false,
														type: "POST",
														data: {
															"user.id": id,
															"user.username": username,
															"user.password": password,
															"user.realname": realname,
															"user.sex" : sex,
															"user.department.departId": departmentId,
															"user.role.id": roleId
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
										$(".deleteUser").on("click", function() {
											var element = $(this).parents("tr");
											var rowId = element.attr("id");
											var id = $(element).children("td").html();
											$.ajax({
												url: "deleteUsers.action",
												cache: false,
												type: "POST",
												data: {
													"user.id": id,
												},
											});
											$("#" + rowId).remove();
										});
									}
								}
							});
						}); 
			//////////////////////////////////
						
				
//					});
				});
			});
		});