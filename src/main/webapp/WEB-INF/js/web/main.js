/**
 * 抽奖前台逻辑
 */
;(function($,win){
	
	function showWinRecord(){
		$("#winDetail").empty();
		$.ajax({
			url:"/sva/mainPage/getRecord",
    		type:"post",
    		contentType:'application/json',
    		dataType:"json",
    		success:function(data){
    			if(data.returnCode == 1){
    				var detail = data.data;
    				var code = "";
    				var html = "";
    				for(var i=0; i<detail.length; i++){
    					var item = detail[i];
    					if(item.prizeCode != code){
    						html = html + ''
    							+ '<div class="record-name">'
    							+ item.name
    							+ '</div>'
    							+ '<div class="record-detail">'
    							+ '<div class="record-detail-1">' + item.username + '</div>'
    							+ '<div class="record-detail-2">' + item.realname + '</div>'
    							+ '<div class="record-detail-3">' + item.phoneNo.substring(item.phoneNo.length-4) + '</div>'
    							+ '</div>';
    						code = item.prizeCode;
    					}else{
    						html = html + ""
    							+ '<div class="record-detail">'
    							+ '<div class="record-detail-1">' + item.username + '</div>'
    							+ '<div class="record-detail-2">' + item.realname + '</div>'
    							+ '<div class="record-detail-3">' + item.phoneNo.substring(item.phoneNo.length-4) + '</div>'
    							+ '</div>';
    					}
    				}
    				html += "<br/>";
    				$("#winDetail").append(html);
        		}
    		}
		});
	}
	
	function bindEvent(){
		$("#prize").on("click",function(e){
			$(".cs-options").toggleClass("active");
			$("#prize").toggleClass("active");
		});
		
		$(".cs-options>ul>li").live("click",function(e){
			var selectedVal = $(this).data("value");
			var selectedDesc = $(this).data("desc");
			var selectedTxt = $(this).text();
			$("#selectedText").text(selectedTxt);
			$("#prize").attr("data-code", selectedVal);
			$("#prize").attr("data-desc", selectedDesc);
			
			$(".cs-options").toggleClass("active");
			$("#prize").toggleClass("active");
			// 更新数量
			var param = {prizeCode: selectedVal};
			$.ajax({
				url:"/sva/lottery/getPrizeCount",
	    		type:"post",
	    		data:JSON.stringify(param),
	    		contentType:'application/json',
	    		dataType:"json",
	    		success:function(data){
	    			if(data.returnCode == 1){
	    				var prizeCount = data.data;
	    				$("#selectedCount").html(prizeCount);
	        		}
	    		}
			});
			// 更新图片
			$(".prizeBox-1").removeClass("active");
			$(".prizeBox-2").removeClass("active");
			$(".prizeBox-3").removeClass("active");
			$(".prizeBox-"+selectedVal).addClass("active");
		});
		
		$(".startRoll").on("click",function(e){
			var code = $("#prize").attr("data-code");
			var count = $("#selectedCount").text();
			if(count == "0"){
				return false;
			}
			if(code){
				$("#confirmPrize").text($("#selectedText").text());
				$("#confirmPrizeDetail").text($("#prize").attr("data-desc"));
				
				$("#confirmPopup").show();
				//$(".popupBox").css("top","0");
				setTimeout(function(){
					$(".popupBox").css("top","0");
				},10);
			}else{
				return false;
			}
		});
		
		$(".confirmBtn").on("click",function(e){
			$(".popupBox").css("top","-773px");
			setTimeout(function(){
				$("#confirmPopup").hide();
				window.location.href="/sva/home/showLottery/"+$("#prize").attr("data-code");
			},500);
		});
		
		$(".cancelBtn").on("click",function(e){
			$(".popupBox").css("top","-773px");
			setTimeout(function(){
				$("#confirmPopup").hide();
			},500);
		});
		
		$(".record").on("click",function(e){
			$("#detailPopup").show();
			showWinRecord();
			setTimeout(function(){
				$(".winPopupBox").css("top","110px");
			},10);
		});
		
		$(".closeDetail").on("click",function(e){
			$(".winPopupBox").css("top","-910px");
			setTimeout(function(){
				$("#detailPopup").hide();
			},500);
		});
	}
	
	function initDetail(list){
		var html = "";
		for(var key in list){
			var item = list[key];
			html = html + ''
				+ '<div class="detail-row">'
				+	'<div class="detail-col-1">'
				+		item.name
				+	'</div>'
				+	'<div class="detail-col-2">'
				+		item.desc
				+	'</div>'
				+	'<div class="detail-col-3">'
				+		item.count+'名'
				+	'</div>'
				+ '</div>';
		}
		$(".prizeDetail").empty();
		$(".prizeDetail").append(html);
	}
	
	function initDropdown(){
		$.ajax({
			url:"/sva/mainPage/getPrizeDetail",
    		type:"post",
    		contentType:'application/json',
    		dataType:"json",
    		success:function(data){
    			if(data.returnCode == 1){
    				var list = data.data;
    				initDetail(list);
    				$(".cs-options>ul").empty();
    				for(var k in list){
    					var el = list[k];
    					$(".cs-options>ul").append('<li class="data-option" data-desc="'+el.desc+'" data-value="'+el.code+'"><span>'+el.name+'</span></li>');
    				}
        		}
    		}
		});
	}
	
	var Main = {
		// 初始化
		init : function(opt){
			initDropdown();
			bindEvent();
		}
	};
	win["Main"] = Main;
})(jQuery,window);

$(function(){
	Main.init();
});