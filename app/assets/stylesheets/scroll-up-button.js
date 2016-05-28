$(document).ready(function(){

	$(document).scroll(function() {
	  var y = $(this).scrollTop();
	  if (y > 50) {
	    $('#scroll-up-switch').fadeIn();
	  } else {
	    $('#scroll-up-switch').fadeOut();
	  }
	});
})