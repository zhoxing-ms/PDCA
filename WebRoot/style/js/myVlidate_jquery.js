// JavaScript Document
function validate() {

	// 1获取文本框的内容
	// document.getElementById("userName"); dom的方式
	// Jquery的查找节点的方式,参数中#加上id属性值可以找到一个节点
	var supplierName = $("#supplierName").find("option:selected").text();
	// var supplierName = obj.val();


	// 使用jquery的XMLHTTPRequest对象get请求的封装
	$.ajax({
		type : "POST", // http请求方式
		url : "purchase_addUI1.action",// 发送给服务器的url
		data : {
			"supplierName" : supplierName
		}, // 发送给服务器的参数
		dataType : "json", // 告诉JQUERY返回的数据格式(注意此处数据格式一定要与提交的servlet返回的数据格式一致,不然不会调用callback)
		success : function(data) {
			var str="";
			$.each(data, function(index, val) {
				
				str+="<tr><td height='22' align='center'>" +
						"<input name='p_type' readOnly  type='text' style='background:transparent;border:none'  value='"+val.productType+"'></td>"+
				"<td height='22' align='center'>"+
				"<input name='p_name' readOnly  type='text' style='background:transparent;border:none'  value='"+val.productName+"'></td>"+
				
				"<td height='22' align='center'>"+
				"<input name='p_price' readOnly  type='text' style='background:transparent;border:none'  value='"+val.price+"'></td>"+
				
				"<td height='22' align='center' style='text-align:center;'>" +
				"<input name='p_num' type='text' value='0' style='background:transparent;border:none' class='numList'></td>"+
				
				"<td height='22' align='center'>" +
				"<input name='p_total' readOnly style='background:transparent;border:none'  type='text'  value='0'>"+
				"</td></tr>";
			});
			
			$("#tbodyList").empty();
			var node = jQuery(str);
			$("#tbodyList").append(node);
			
			$(".numList").blur(function(){
				var num=$(this).val();
				var price = $(this).parent("td").prev().children("input").val();
				var temp=num*price;
				$(this).parent("td").next().children("input").val(temp);
			});
		

		}
	});
}

/*function setMoney(){

	//var num = $(this).val();
	alert(event.target.value);
	var price = $(this).parent("td").prev().text();
	alert("price="+price);
	var temp=num*price;
	$(this).parent("td").next().text(temp);
}
*/