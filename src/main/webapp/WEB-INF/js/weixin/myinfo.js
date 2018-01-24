$(window).load(function()
{
 // 页面高度
    var h = window.innerHeight;
//    var w = window.innerWidth;
    $("#baseInfo").css("height", h/4);
    $("#advanceInfo").css("height", h/6);
    $("#login_out").css("height", h/13);
    $("#change_pwd").css("height", h/13);
});
$(window).ready(function()
{
    $("#item_advance_pw").click(function(){
        location.href='../jsp/weixin/changepwd.html';
    })
    $("#change_pwd").click(function(){
        window.history.back(-1);
    })
    $("#item_advance_prz").click(function(){
        location.href='../jsp/weixin/wininfo.html';
    })
    
    
    
    
})