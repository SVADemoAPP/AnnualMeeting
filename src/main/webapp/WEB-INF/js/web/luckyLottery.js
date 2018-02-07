/**
 * 抽奖前台逻辑
 */
;(function($,win){
	var timerBlink;
	var timerLuckeName1;
	var timerLuckeName2;
	var timerLuckeName3;
	var timerLuckeName4;
	var isBegin;
	var accountInfo;
	var candidates;
	
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
	
	function getCandidate(){
		$.ajax({
			url:"/sva/lottery/getCandidate",
    		type:"post",
    		data:"",
    		contentType:'application/json',
    		dataType:"json",
    		success:function(data){
    			if(data.returnCode != 1){
    				alert(data.error);
        		}else{
        			candidates = data.data;
        		}
    		}
		});
	}
	
	function startNum() {
		timerLuckeName1 = setInterval(function(){
			$(".col-1").each(function(index){
				var _name = $(this);
				var pcount = candidates.length;
				var name = Math.floor(Math.random() * pcount);
				_name.innerTxt(candidates[num]);
			});
		},0);
		timerLuckeName2 = setInterval(function(){
			$(".col-2").each(function(index){
				var _name = $(this);
				var pcount = candidates.length;
				var name = Math.floor(Math.random() * pcount);
				_name.innerTxt(candidates[num]);
			});
		},0);
		timerLuckeName3 = setInterval(function(){
			$(".col-3").each(function(index){
				var _name = $(this);
				var pcount = candidates.length;
				var name = Math.floor(Math.random() * pcount);
				_name.innerTxt(candidates[num]);
			});
		},0);
		timerLuckeName4 = setInterval(function(){
			$(".col-4").each(function(index){
				var _name = $(this);
				var pcount = candidates.length;
				var name = Math.floor(Math.random() * pcount);
				_name.innerTxt(candidates[num]);
			});
		},0);
		timerLuckeName5 = setInterval(function(){
			$(".col-5").each(function(index){
				var _name = $(this);
				var pcount = candidates.length;
				var name = Math.floor(Math.random() * pcount);
				_name.innerTxt(candidates[num]);
			});
		},0);
	}
	
	function showResult(data){
		
	}
	
	function startShowResult(detail, callback){
		if(isBegin) return false;
		isBegin = true;
		var tempList = _.union(detail,[]);
		for(var i=1; i<6; i++){
			setTimeout(function(){
				var _names = $(".col-"+i);
				_names.each(function(index){
					if(tempList.length){
						$(this).innerText = tempList[0].realname;
						tempList.shift();
					}
				});
				if(i==5){
					isBegin = false;
					// 灯泡动画 
					stopBlink();
					allLightOn();
					showResult(detail);
					if(callback) callback();
				}
			}, i*3000);
		}
	}
	
	function refresh(){
		$(".popup").hide();
		startBlink();
		$(".num").css('backgroundPositionY',0);
		$(".arrow").css({transform:"rotate(0deg)"});
		$(".arrow").attr("data-angle",0);
		$(".quitBox").css({transform:"rotate(180deg)"});
		$(".countNo-1").html("0");
		$(".countNo-2").html("6");
		clearInterval(timerCount);
		//showPrizeCount();
		if(eventSource){
			eventSource.close();
			eventSource = null;
		}
	}
	
	function bindEvent(){
		
		$(".handle").on("click",function(e){
			var flag = $(".handle").attr("data-flag");
			if(flag && flag == "false") return false;
			$(".handle").attr("data-flag","false");
			$(".handle").css({background:"url(/sva/images/handleOn.png) bottom no-repeat"});
			// 开始名字跳动
			startNum();
			// 请求数据并展示
			$.ajax({
				url:"/sva/lottery/getLuckyWinners",
        		type:"post",
        		data:"",
        		contentType:'application/json',
        		dataType:"json",
        		success:function(data){
        			if(data.returnCode == 1){
        				startShowResult(data.data,function(){
            				$(".handle").attr("data-flag","true");
            				$(".handle").css({background:"url(/sva/images/handleOff.png) bottom no-repeat"});
        				});
            		}else{
            			$(".handle").attr("data-flag","true");
        				$(".handle").css({background:"url(/sva/images/handleOff.png) bottom no-repeat"});
            		}
        		}
			});
		});
		
		$(".confirm").on("click",function(e){
			var prizeCode = $("#typeHidden").val();
			recordWinner(prizeCode, 1, refresh);
		})
		
		$("#back").on("click",function(e){
			window.location.href="/sva/home/showMain";
		});
	}
	
	var Lucky = {
		// 初始化
		init : function(opt){
			startBlink();
			getCandidate();
			//showPrizeCount();
			bindEvent();
		}
	};
	win["Lucky"] = Lucky;
})(jQuery,window);

$(function(){
	Lucky.init();
});