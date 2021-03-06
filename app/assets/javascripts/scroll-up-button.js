//button that appears in the middle of the page bottom, when clicked, will scroll to top

var scrollButton = function(){

	//initially hide scroll-up-switch
	$("#scroll-up-switch").fadeOut(0);

	//when scroll down 50px, fade in scroll button
	$(document).scroll(function() {
	  var y = $(this).scrollTop();
	  if (y > 50) {
	    $('#scroll-up-switch').fadeIn();
	  } else {
	    $('#scroll-up-switch').fadeOut();
	  }
	});


	//when scroll button clicked, scroll to top
	$(document).on("click", "#scroll-up-switch", function(){
		$('html, body').animate({scrollTop: 0}, 'slow');
	});
};

//load scrollbutton on page load
$(document).ready(scrollButton);
//loac scrollbutton on turbolinks page load
$(document).on('page:load', scrollButton);