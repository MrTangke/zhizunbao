$(function() {
	$('nav#mmenu').mmenu({
		extensions	: [ 'effect-slide-menu', 'pageshadow' ],
		counters	: false,
		navbar 		: {
			title		: '菜单',
		},
		navbars		: [
			 {
				position	: 'top',
				content		: [
					'prev',
					'title',
					'close'
				]
			}, {
				position	: 'bottom',
				content		: [
					''
				]
			} 
		]
	});
});


$(function(){
	$(".search .searbtn").click(function(){
		$(".seardown").toggle();
	})
	$(".seardown .searclosed").click(function(){
		$(".seardown").hide();
	})
})


$(".nav ul li:last").css({"border-right":"1px solid #d1d3d5"})

$(function(){
	$(".inpcon .container").slick({
		dots: false,
        autoplay:true,
        slidesToShow:4,
        slidesToScroll:4,
        arrows:true,
        autoplaySpeed:3000,
        responsive: [
					    {
					        breakpoint: 768,
					        settings: {
					            slidesToShow: 3,
					        }
					    },
					    {
					        breakpoint: 480,
					        settings: {
					            slidesToShow: 2,
					        }
					    }
					    
                ]
	})
})

$(".innewcon ul li:nth-child(3n)").css({"margin-right":"0"})
$(".footernav dl:last").css({"border-right":"1px solid #dfdfdf"})

$(".pro ul li:nth-child(4n)").css({"margin-right":"0"})


$(function(){
	$(".link").click(function(){
		$(".lindown").toggle(200);
	})
})



$(function(){
	$(".fenlei .container").slick({
		dots: false,
	    autoplay:true,
	    slidesToShow:4,
	    slidesToScroll:4,
	    arrows:true,
	})
})



$(document).ready(function() {
		
			
		if($("#menu > div").length > 4){
			$('#menu').slick({
		    	slidesToShow:4,
		    	infinite:false,
		    	responsive: [
					    {
					        breakpoint: 768,
					        settings: {
					            slidesToShow: 3,
					        }
					    },
					    {
					        breakpoint: 480,
					        settings: {
					            slidesToShow: 2,
					        }
					    }
					    
                ]
		    });
	
			if($("#menu .cur").length>0){
				$("#menu").slick("slickGoTo",$("#menu .cur").parent().data("slick-index")-3);
			}
		}
		
		else {
			$('#menu').slick({
				slidesToShow:4,
				infinite:false,
				responsive: [
					    {
					        breakpoint: 768,
					        settings: {
					            slidesToShow: 3,
					        }
					    },
					    {
					        breakpoint: 480,
					        settings: {
					            slidesToShow: 2,
					        }
					    }
					    
                ]
			});	
			
		}
		
		
	});
	
	
	
	$(function(){
		$(".big ul").slick({
			fade: true,
			useTransform: true,
			arrows: false,
			asNavFor:".small"
		})
		$(".small").slick({
			focusOnSelect: true,
			autoplay:true,
			vertical:true,
			slidesToShow: 6,
			useTransform: true,
			arrows: false,
			asNavFor:".big ul",
			responsive: [
					    {
					        breakpoint: 769,
					        settings: {
					            vertical:false,
					        }
					    },
					    {
					        breakpoint: 481,
					        settings: {
					            slidesToShow: 3,
					             vertical:false,
					        }
					    }
					    
                ]
		});
	})


$(function(){
	$(".detailed_pro tr").find("td:first").css({"width":"40%","background":"#f5f7f8","font-weight":"bold"});
	$(".contact_us li:nth-child(3n)").css({"margin-right":"0"});
	$(".ptionshow .xgcp ul li:last").css({"margin-right":"0"})
})



$(function(){
	$(".phonehonor").slick({
		dots: true,
	    autoplay:true,
	    arrows:false,
	})
})



$(function(){
	$(".nav ul li").hover(function(){
		$(this).find("ul").slideDown(200);
	},function(){
		$(this).find("ul").stop(true).slideUp(200);
	})
})
$(function(){
	$(".nav ul li ul li").hover(function(){
		$(this).find(".threedown").slideDown(200);
	},function(){
		$(this).find(".threedown").stop(true).hide(200);
	})
})

