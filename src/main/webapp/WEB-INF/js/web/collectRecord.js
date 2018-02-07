/**
 * 集卡记录页面
 */
;(function($,win){
	var oTable;
	
	function initTable(){
		$.post("/sva/mainPage/getRecord",function(data){
			if(data.data){
				if(oTable){oTable.fnDestroy();};
				oTable = $('#table').dataTable({
					"bProcessing": true,
					"sDom": 'rt<"toolbar"lp<"clearer">>',
					"sPaginationType": "full_numbers",
					"aaData":data.data,
					"bStateSave": true,
					"aoColumnDefs": [
						{ 
							"aTargets": [0],
							"bVisible": false,
							"mData": "id" 
						},
							{ 
							"aTargets": [1],
							"mData": "realname"
						},
						{ 
							"aTargets": [2],
							"mData": "username"
						},
						{ 
							"aTargets": [3],
							"mData": "name"
						},
						{ 
							"aTargets": [4],
							"mData": "confirm",
							"mRender": function ( data, type, full ) {
								var html = "未领取";
								if(data){
									html = "已领取";
								}
								return html;
							}
						},
						{
							"aTargets": [5],
							"bSortable": false,
							"bFilter": false,
							"mData": function(source, type, val) {
								return "";
							},
							"mRender": function ( data, type, full ) {
								var cssString = "width: 54px;height:30px;font-size: 13px;font-family:inherit;";
								var diabled = "";
								if(full.gotFu){
									diabled += "disabled";
								}
								var html = "" +
									'<input type="button" data-type="confirm" '
									+diabled+' style="'+cssString+'" data-id="'+full.id+'" value="领取">';
								
								return html;
							}
						}
					]
				});
			}
		});
	}
	
	function bindEvent(){
		$("input[data-type='confirm']").live("click",function(e){
			if(confirm("是否确认领取")){
            	var id = $(this).data("id");
        		$.post("/sva/mainPage/updatePrizeConfrim",{accountId:id},function(data){
        			if(data.error){
        				alert("领取失败");
	           		}else{
	           			initTable();
	           		}
        		});
        	}
		});
	}
	
	var Collect = {
		// 初始化
		init : function(opt){
			initTable();
			bindEvent();
		}
	};
	win["Collect"] = Collect;
})(jQuery,window);

$(function(){
	Collect.init();
});