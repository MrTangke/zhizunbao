/**
 * Created by Administrator on 2016/5/4.
 */
$(function(){
    if (!window.home) {
        var home = new Object();
    }

    home = {
        init: function () {
            home.homeImageLazy();                     //lazyload
            home.menuAnimate();                       //首页菜单鼠标经过效果
        },

        //lazyload
        homeImageLazy: function () {
            $('img.lazy').lazyload({
                // placeholder : "img/grey.gif",
                threshold: 200,
                effect: 'fadeIn'
            });
        },

        //首页菜单鼠标经过效果
        menuAnimate: function () {
            var timerShow, timerHide;
            //分类
            $("#menu_main").find("li").hover(function () {
                var name = $(this).attr('name'),
                    subClass = '.' + name + '_sub',
                    menuSub = $('#menu_sub');

                if ($(subClass)[0]) {

                    $(this).addClass('active').siblings().removeClass('active active_s');
                    clearTimeout(timerHide);

                    timerShow = setTimeout(function () {
                        menuSub.show();
                        $(subClass).show().siblings().hide();
                        $(subClass).addClass('active').siblings().removeClass('active');
                    }, 0);

                    $(subClass).find('.submenu_all').hide();
                    $(subClass).find('.submenu_all:first').show();
                } else {
                    $(this).addClass('active_s').siblings().removeClass('active active_s');
                }
            }, function () {
                clearTimeout(timerShow);

                timerHide = setTimeout(function () {
                    $('#menu_sub').hide();
                }, 0);

                $("#menu_main").find("li").removeClass('active active_s');
            });
            $("#menu_sub").hover(function () {
                var name = $(this).find('.submenu.active').attr('name'),
                    arr = name.split('_');
                clearTimeout(timerHide);
                $('.' + arr[0]).addClass('active');
            }, function () {
                clearTimeout(timerShow);

                timerHide = setTimeout(function () {
                    $('#menu_sub').hide();
                }, 0);

                $("#menu_main").find("li").removeClass('active active_s');
            });
        }
    };
    home.init();

//        轮播
    var oLists=$("#lists").find("li");
    var oItems=$("#items").find("li");
    var index=0,data;
    var pageCount=oLists.length;
//        点击切换图片
    oItems.click(function(){
        index=$(this).index();
        $(this).addClass("active").siblings().removeClass("active");
        oLists.eq(index).fadeIn().siblings().fadeOut();
    });
//        自动切换图片
    data=setInterval(function(){
        var nextPage;
        nextPage=(index+1)%pageCount;
        oItems.eq(nextPage).click();
    },2000);

    //小轮播
    $('#s_lun').slideBox({
        hideClickBar : false
    });
    $('#s_lun_car').slideBox({
        hideClickBar : false
    });

    //返回顶部
    $(window).scroll(function(){
        //alert(1);
        //得到滚动条距离窗口顶部的距离
        var distance=$(this).scrollTop();
        //通过distance判断返回顶部按钮什么时候显示
        if(distance>=900){
            $("#backtop").show();
        }else{
            $("#backtop").hide();
        }
    });
    $("#backtop").click(function(){
        $('body').animate({
            'scrollTop':'0'
        });
    });
});