/**
 * 抽奖前台逻辑
 */
;(function($,win){
	var timerBlink;
	var timerCountdown;
	
	function startBlink(){
		timerBlink = setInterval(function(){
			var oldImg = $(".mask").data("img");
			if(oldImg && parseInt(oldImg)%2 == 1){
				$(".mask").css({"background":"url(../images/blinkLeft.png) no-repeat"});
			}else{
				$(".mask").css({"background":"url(../images/blinkRight.png) no-repeat"});
			}
		},500);
	}
	
	var IndoorMap = {
		// 初始化
		init : function(opt){
			var hm = new Map(opt);
			hm._init();
			return hm;
		},
		// 改变设置
		changeOption : function(obj, opt){
			$.extend(obj._opt, opt);
			obj._init();
		},
		
		refreshPoint : function(obj,data){
			obj._refreshPoint(data);
		},
		
		clear : function(obj){
			obj._clear();
		}
	};
	win["IndoorMap"] = IndoorMap;
})(jQuery,window);

$(function(){
	var u = 265;
	$('.btn').click(function(){
		if(isBegin) return false;
		isBegin = true;
		$(".num").css('backgroundPositionY',0);
		var result = numRand();
		$('#res').text('随机摇奖结果 = '+result);
		var num_arr = (result+'').split('');
		$(".num").each(function(index){
			var _num = $(this);
			setTimeout(function(){
				_num.animate({ 
					backgroundPositionY: (u*60) - (u*num_arr[index])
				},{
					duration: 6000+index*3000,
					easing: "easeInOutCirc",
					complete: function(){
						if(index==3) isBegin = false;
					}
				});
			}, index * 300);
		});
	});	
});