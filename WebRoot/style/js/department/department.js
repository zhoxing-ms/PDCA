$(function() {
			/*
				设置鼠标进入和离开的JS特效
			*/
			$("#addDepartLink").mouseenter(function() {
				$("#addDepartLink").css("background-color","#F0F8FF");
			});
			$("#addDepartLink").mouseout(function() {
				$("#addDepartLink").css("background-color","");
			});
			$("#listDepartLink").mouseenter(function() {
				$("#listDepartLink").css("background-color","#F0F8FF");
			});
			$("#listDepartLink").mouseout(function() {
				$("#listDepartLink").css("background-color","");
			});
			/*
				点击“添加部门”,局部刷新切换到add.jsp
			*/
			$("#addDepartLink").click(function() {
				var url = "addDepartment.action";
				$("#content").load(url, function() {
					/*
						点击"添加"按钮，进行添加部门
					*/
					$("#addbtn").click(function() {
						var departName = $("#department-name").val();
						var departDesc = $("#department-desc").val();
						if("" == departName || "" == departDesc) {
							$("#addInfo").html("添加失败！");
							return;
						}
						$.ajax({
							url: "addDepart.action",
							cache: false,
							type: "POST",
							data: {
								"department.departName": departName,
								"department.departDesc": departDesc
							},
							success: function() {
								$("#department-name").val("");
								$("#department-desc").val("");
								$("#addInfo").html("添加成功！");
							}
						});
					});
				});
			});
			
			/*
				点击“部门列表”,局部刷新切换到list.jsp
			*/
			$("#listDepartLink").click(function() {
				var url = "listDepartment.action";
				$("#content").load(url, function() {
					 
						var condition = $("#departmentCondition").val();
						$.ajax({
							url: "listDepart.action",
							cache: false,
							type: "POST",
							data: {
								"condition":condition
							},
							dataType: "json",
							success: function(departments) {
								$("#tableContent").html("");
								if(departments == "") {
									$("#tableContent").append("<tr><td colspan='4' align='center'>查无记录！</td></tr>");
								} else {
									for(var i = 0; i < departments.length; i++) {
										var tdStr = "<tr id='line"+ (i + 1) +"'>";
										$.each(departments[i], function(name, value) {
											tdStr += "<td>" + value + "</td>";
										});
										
										tdStr += "<td>";
										tdStr += "<div class='am-dropdown am-dropdown-up'>";
										tdStr += "<button class='am-btn am-btn-default am-btn-xs am-dropdown-toggle' data-am-dropdown-toggle><span class='am-icon-cog'></span> <span class='am-icon-caret-down'></span></button>";
										tdStr += "<ul class='am-dropdown-content'>";
										tdStr += "<li><a class='updateDepart'>1. 编辑</a></li>";
										tdStr += "<li><a class='deleteDepart'>2. 删除</a></li>";
										tdStr += "</ul>";
										tdStr += "</div>";
										tdStr += "</td>"; 
										tdStr += "</tr>";
										$("#tableContent").append($(tdStr));
										$(".am-dropdown").dropdown({
											boundary: "window"
										});
									}
									$(".updateDepart").on("click", function() {
										var element = $(this).parents("tr");
										var rowId = element.attr("id");
										var departId = $(element).children("td").html(); 
										var departName = $(element).children("td").next().html();
										var departDesc = $(element).children("td").next().next().html();
										//alert(departName);
										//alert(departDesc);
										//alert(departId);
										$("#departId").val(departId);
										$("#departName").val(departName);
										$("#departDesc").val(departDesc);
										$("#updatePage").modal({
											relatedElement: this,
											onConfirm: function(data) {
												departId = data;
												departName = $("#departName").val();
												departDesc = $("#departDesc").val();
												$.ajax({
													url: "updateDepart.action",
													cache: false,
													type: "POST",
													data: {
														"department.departId": departId,
														"department.departName": departName,
														"department.departDesc": departDesc
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
									$(".deleteDepart").on("click", function() {
										var element = $(this).parents("tr");
										var rowId = element.attr("id");
										var departId = $(element).children("td").html();
										$.ajax({
											url: "deleteDepart.action",
											cache: false,
											type: "POST",
											data: {
												"department.departId": departId,
											},
										});
										$("#" + rowId).remove();
									});
								}
							}
						});
//					});
						
						////////////
						$("#departmentSearch").click(function() { 
									var condition = $("#departmentCondition").val(); 
//									alert(condition);
									$.ajax({
										url: "listDepart.action",
										cache: false,
										type: "POST",
										data: {
											"condition":condition
										},
										dataType: "json",
										success: function(departments) {
											$("#tableContent").html("");
											if(departments == "") {
												$("#tableContent").append("<tr><td colspan='4' align='center'>查无记录！</td></tr>");
											} else {
												for(var i = 0; i < departments.length; i++) {
													var tdStr = "<tr id='line"+ (i + 1) +"'>";
													$.each(departments[i], function(name, value) {
														tdStr += "<td>" + value + "</td>";
													});
													
													tdStr += "<td>";
													tdStr += "<div class='am-dropdown am-dropdown-up'>";
													tdStr += "<button class='am-btn am-btn-default am-btn-xs am-dropdown-toggle' data-am-dropdown-toggle><span class='am-icon-cog'></span> <span class='am-icon-caret-down'></span></button>";
													tdStr += "<ul class='am-dropdown-content'>";
													tdStr += "<li><a class='updateDepart'>1. 编辑</a></li>";
													tdStr += "<li><a class='deleteDepart'>2. 删除</a></li>";
													tdStr += "</ul>";
													tdStr += "</div>";
													tdStr += "</td>"; 
													tdStr += "</tr>";
													$("#tableContent").append($(tdStr));
													$(".am-dropdown").dropdown({
														boundary: "window"
													});
												}
												$(".updateDepart").on("click", function() {
													var element = $(this).parents("tr");
													var rowId = element.attr("id");
													var departId = $(element).children("td").html(); 
													var departName = $(element).children("td").next().html();
													var departDesc = $(element).children("td").next().next().html();
													//alert(departName);
													//alert(departDesc);
													//alert(departId);
													$("#departId").val(departId);
													$("#departName").val(departName);
													$("#departDesc").val(departDesc);
													$("#updatePage").modal({
														relatedElement: this,
														onConfirm: function(data) {
															departId = data;
															departName = $("#departName").val();
															departDesc = $("#departDesc").val();
															$.ajax({
																url: "updateDepart.action",
																cache: false,
																type: "POST",
																data: {
																	"department.departId": departId,
																	"department.departName": departName,
																	"department.departDesc": departDesc
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
												$(".deleteDepart").on("click", function() {
													var element = $(this).parents("tr");
													var rowId = element.attr("id");
													var departId = $(element).children("td").html();
													$.ajax({
														url: "deleteDepart.action",
														cache: false,
														type: "POST",
														data: {
															"department.departId": departId,
														},
													});
													$("#" + rowId).remove();
												});
											}
										}
									}); 
								});
						/////////////
				});
			});
	});
