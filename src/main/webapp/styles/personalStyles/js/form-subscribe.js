// JavaScript Document

// newsletter form
$(document).ready(function() {
	$('form#subscribe').submit(function() {
	$('form#subscribe .subscribeerror').remove();
	var hasError = false;
	$('.subscriberequiredField').each(function() {
	if(jQuery.trim($(this).val()) == '') {
    var labelText = $(this).prev('label').text();
    $(this).parent().append('<span class="subscribeerror">Please enter your'+labelText+'</span>');
    $(this).addClass('inputError');
    hasError = true;
    } else if($(this).hasClass('subscribeemail')) {
    var subscribeemailReg = /^([\w-\.]+@([\w-]+\.)+[\w-]{2,4})?$/;
    if(!subscribeemailReg.test(jQuery.trim($(this).val()))) {
    var labelText = $(this).prev('label').text();
    $(this).parent().append('<span class="subscribeerror">Please enter a valid'+labelText+'</span>');
    $(this).addClass('inputError');
    hasError = true;
    }
    }
    });
    if(!hasError) {
    $('form#subscribe input.submit').fadeOut('normal', function() {
    $(this).parent().append('');
    });
    var formInput = $(this).serialize();
    $.post($(this).attr('action'),formInput, function(data){
    $('form#subscribe').slideUp("fast", function() {
    $(this).before('<div class="subscribesuccess">Thank you for subscribing.</div>');
    });
    });
    }
    return false;
    });
});