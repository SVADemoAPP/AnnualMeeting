/**
 * 集卡记录页面
 */
;(function($,win){
	
	function clear(){
		$("#text").val("");
		$("#fileField").val("");
		$("#console").html("");
	}
	
	function check(){
		var txt = $("#text").val();
		if(!txt){
			$("#console").html("文本不能为空！");
			return false;
		}else{
			return true;
		}
	}
	
	function bindEvent(){
		$("#submit").on("click",function(e){
			if(confirm("确认推送？")){
				// 输入校验
				if(check()){
					$("#submit").submit();
				}else{
					return false;
				}
        	}
		});
		
		$("#clear").on("click",function(e){
			clear();
		});
	}
	
	var Push = {
		// 初始化
		init : function(opt){
			bindEvent();
		}
	};
	win["Push"] = Push;
})(jQuery,window);

$(function(){
	Push.init();
});