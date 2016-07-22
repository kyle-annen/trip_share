
//function to resize trip main image
//toggles the classes of button and image
//classes located in trips.scss
//targets located in trips/show.html.erb
$(document).on('click', '#trip-resize-anchor', function(){
	//variable declarations
	var button = $('#trip-resize-anchor i');
	var image = $('#trip-image');
	//toggle states
	button.toggleClass('fa-plus');
	button.toggleClass('fa-minus');
	image.toggleClass('small-trip-image');
})