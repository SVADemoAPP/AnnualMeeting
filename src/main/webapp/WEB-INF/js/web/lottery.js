/**
 * 抽奖前台逻辑
 */
;(function($,win){
	var timerBlink;
	var timerCountdown;
	var isBegin;
	
	function startBlink(){
		timerBlink = setInterval(function(){
			var oldImg = $(".mask").attr("data-img");
			if(oldImg && parseInt(oldImg) == 1){
				$(".mask").css({"background":"url(/sva/images/blinkLeft.png) no-repeat"});
				$(".mask").attr("data-img",0);
			}else{
				$(".mask").css({"background":"url(/sva/images/blinkRight.png) no-repeat"});
				$(".mask").attr("data-img",1);
			}
		},500);
	}
	
	function stopBlink(){
		clearInterval(timerBlink);
	}
	
	function allLightOn(){
		$(".mask").css({"background":"url(/sva/images/lightAll.png) no-repeat"});
	}
	
	function showPrizeCount(){
		var param = {prizeCode: $("#typeHidden").val()};
		$.ajax({
			url:"/sva/lottery/getPrizeCount",
    		type:"post",
    		data:JSON.stringify(param),
    		contentType:'application/json',
    		dataType:"json",
    		success:function(data){
    			if(data.returnCode == 1){
    				var prizeCount = data.data;
    				$(".prizeCount").html(prizeCount);
        		}
    		}
		});
	}
	
	function waitForNotice(detail){
		$(".popup").show();
	}
	
	function startShowResult(detail){
		if(isBegin) return false;
		isBegin = true;
		var u = 229;
		$(".num").css('backgroundPositionY',0);
		var num_arr = (detail.username+'').split('');
		$(".num").each(function(index){
			var _num = $(this);
			setTimeout(function(){
				_num.animate({ 
					backgroundPositionY: (u*60) - (u*num_arr[index])
				},{
					duration: 6000+index*3000,
					easing: "easeInOutCirc",
					complete: function(){
						if(index==5){
							isBegin = false;
							// 灯泡动画 
							stopBlink();
							allLightOn();
							waitForNotice(detail);
						}
					}
				});
			}, index * 300);
		});
	}
	
	function bindEvent(){
		$(".handle").on("mousedown",function(e){
			$(".handle").css({background:"url(/sva/images/handleOn.png) bottom no-repeat"});
		});
		
		$(".handle").on("mouseup",function(e){
			$(".handle").css({background:"url(/sva/images/handleOff.png) bottom no-repeat"});
		});
		
		$(".handle").on("click",function(e){
			// 请求数据并展示
			var param = {prizeCode: $("#typeHidden").val()};
			$.ajax({
				url:"/sva/lottery/getNumber",
        		type:"post",
        		data:JSON.stringify(param),
        		contentType:'application/json',
        		dataType:"json",
        		success:function(data){
        			if(data.returnCode == 1){
        				startShowResult(data.data);
            		}
        		}
			});
		});
		
		$(".arrow").on("click",function(e){
			// 图标方向改变
			var angle = parseInt($(".arrow").attr("data-angle"));
			var newAng = (angle+180)%360;
			$(".arrow").css({transform:"rotate("+newAng+"deg)"});
			$(".arrow").attr("data-angle",newAng);
			// 隐藏菜单toggle
			var newAng = (angle+180)%360;
			$(".quitBox").css({transform:"rotate("+newAng+"deg)"});
		});
	}
	
	var IndoorMap = {
		// 初始化
		init : function(opt){
			startBlink();
			showPrizeCount();
			bindEvent();
		}
	};
	win["IndoorMap"] = IndoorMap;
})(jQuery,window);

$(function(){
	var u = 265;
	IndoorMap.init();
});