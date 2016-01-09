$(function() {
			/*
				设置鼠标进入和离开的JS特效
			*/
			$("#addDocumentLink").mouseenter(function() {
				$("#addDocumentLink").css("background-color","#F0F8FF");
			});
			$("#addDocumentLink").mouseout(function() {
				$("#addDocumentLink").css("background-color","");
			});
			$("#listDocumentLink").mouseenter(function() {
				$("#listDocumentLink").css("background-color","#F0F8FF");
			});
			$("#listDocumentLink").mouseout(function() {
				$("#listDocumentLink").css("background-color","");
			});
			/*
				点击“添加文档”,局部刷新切换到add.jsp
			*/
			$("#addDocumentLink").click(function() {
				var url = "addDocumentPage.action";
				$("#content").load(url);
			});
			
			/*
				点击“文档列表”,局部刷新切换到list.jsp
			*/
			$("#listDocumentLink").click(function() {
				var url = "listDocumentPage.action";
				$("#content").load(url, function() {
//					$("#documentSearch").click(function() {
						var condition = $("#documentCondition").val();
						$.ajax({
							url: "listDocuments.action",
							cache: false,
							type: "POST",
							data: {
								"condition":condition
							},
							dataType: "json",
							success: function(documents) {
								$("#tableContent").html("");
								if(documents == "") {
									$("#tableContent").append("<tr><td colspan='4' align='center'>查无记录！</td></tr>");
								} else {
									for(var i = 0; i < documents.length; i++) {
										var tdStr = "<tr id='line"+ (i + 1) +"'>";
										$.each(documents[i], function(name, value) {
											if(name == "docName") {
												tdStr += "<td><a href='${pageContext.request.contextPath}/down.do?resourceName="+ value +"'>"+ value +"</a></td>";
											} else {
												tdStr += "<td>" + value + "</td>";
											}
										});
										
										tdStr += "<td>";
										tdStr += "<div class='am-dropdown am-dropdown-up'>";
										tdStr += "<button class='am-btn am-btn-default am-btn-xs am-dropdown-toggle' data-am-dropdown-toggle><span class='am-icon-cog'></span> <span class='am-icon-caret-down'></span></button>";
										tdStr += "<ul class='am-dropdown-content'>";
										tdStr += "<li><a class='deleteDocument'>1. 删除</a></li>";
										tdStr += "</ul>";
										tdStr += "</div>";
										tdStr += "</td>"; 
										tdStr += "</tr>";
										$("#tableContent").append($(tdStr));
										$(".am-dropdown").dropdown({
											boundary: "window"
										});
									}
									$(".deleteDocument").on("click", function() {
										var element = $(this).parents("tr");
										var rowId = element.attr("id");
										var id = $(element).children("td").html();
										var docName = $($(element).children("td").next().html()).html();
										$.ajax({
											url: "deleteDocument.action",
											cache: false,
											type: "POST",
											data: {
												"document.id": id,
												"document.docName": docName
											},
											success: function() {
												alert(ok);
											}
										});
										$("#" + rowId).remove();
									});
								}
							}
						});
						
						
		////////////////////////////////////
						$("#documentSearch").click(function() {
							var condition = $("#documentCondition").val(); 
							$.ajax({
								url: "listDocuments.action",
								cache: false,
								type: "POST",
								data: {
									"condition":condition
								},
								dataType: "json",
								success: function(documents) {
									$("#tableContent").html("");
									if(documents == "") {
										$("#tableContent").append("<tr><td colspan='4' align='center'>查无记录！</td></tr>");
									} else {
										for(var i = 0; i < documents.length; i++) {
											var tdStr = "<tr id='line"+ (i + 1) +"'>";
											$.each(documents[i], function(name, value) {
												if(name == "docName") {
													tdStr += "<td><a href='${pageContext.request.contextPath}/down.do?resourceName="+ value +"'>"+ value +"</a></td>";
												} else {
													tdStr += "<td>" + value + "</td>";
												}
											});
											
											tdStr += "<td>";
											tdStr += "<div class='am-dropdown am-dropdown-up'>";
											tdStr += "<button class='am-btn am-btn-default am-btn-xs am-dropdown-toggle' data-am-dropdown-toggle><span class='am-icon-cog'></span> <span class='am-icon-caret-down'></span></button>";
											tdStr += "<ul class='am-dropdown-content'>";
											tdStr += "<li><a class='deleteDocument'>1. 删除</a></li>";
											tdStr += "</ul>";
											tdStr += "</div>";
											tdStr += "</td>"; 
											tdStr += "</tr>";
											$("#tableContent").append($(tdStr));
											$(".am-dropdown").dropdown({
												boundary: "window"
											});
										}
										$(".deleteDocument").on("click", function() {
											var element = $(this).parents("tr");
											var rowId = element.attr("id");
											var id = $(element).children("td").html();
											var docName = $($(element).children("td").next().html()).html();
											$.ajax({
												url: "deleteDocument.action",
												cache: false,
												type: "POST",
												data: {
													"document.id": id,
													"document.docName": docName
												},
												success: function() {
													alert(ok);
												}
											});
											$("#" + rowId).remove();
										});
									}
								}
							});
						});				
		////////////////////////////////////
//					});
				});
			});
		});