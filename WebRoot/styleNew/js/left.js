$(document).ready(function(){
	$(".menu_main").on("click",function(event, arg1){
		if($(this).attr("Class").indexOf("open")<=0){				 
			$(".menu_main").removeClass("open");
			$(".menu_main").removeClass("off");
			$(".menu_main").not(this).addClass("off");
			$(this).addClass("open");
			$(".menu_listmenu").hide() ;
			$("#"+$(this).attr("id")+"_div").show();
			if(arg1 == null){
				var url = $("#"+$(this).attr("id")+"_div a").attr("href");
				parent.main.location.href = url;
			}else{
				parent.main.location.href = arg1;
			}
		}
	});
		$(".menu_main:first").trigger("click");
	
});
