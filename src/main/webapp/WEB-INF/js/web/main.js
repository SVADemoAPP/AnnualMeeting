/**
 * 抽奖前台逻辑
 */
;(function($,win){
	
	
	function bindEvent(){
		$("#prize").on("click",function(e){
			$(".cs-options").addClass("active");
		});
		
		
	}
	
	var Main = {
		// 初始化
		init : function(opt){
			bindEvent();
		}
	};
	win["Main"] = Main;
})(jQuery,window);

$(function(){
	Main.init();
});