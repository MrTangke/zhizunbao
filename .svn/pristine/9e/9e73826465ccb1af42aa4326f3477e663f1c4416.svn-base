/**
 * Created by Administrator on 2016/5/19.
 */
//出生日期
/*;!function(){
    laydate({
        elem: '#birthDate'
    })
}();*/
$(function(){
//        时间期限
    $(".before").click(function () {
        var em=$(".c_price").find("em");
        thisId = $(this).attr("data-price");
        $(this).addClass("active").siblings().removeClass("active");
        em.text(thisId);
    });
//        menu
    $(window).scroll(function(){
        //得到滚动条距离窗口顶部的距离
        var distance=$(this).scrollTop();
//            console.log(distance);
        if(distance>=600){
            $("#detailMenu").addClass("menu_active");
        }else{
            $("#detailMenu").removeClass("menu_active");
        }
    })
});
//    tab切换
$(".detail_menu").find("li").click(function () {
    $(this).addClass("active").siblings().removeClass("active");
    var index=$(this).index();
//        alert(index);
    $(".detail_introduction").find("div.detail").eq(index).css("display","block").siblings().css("display","none");
});