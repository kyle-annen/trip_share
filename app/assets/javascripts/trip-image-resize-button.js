$(document).on('click', '#trip-resize-anchor', function(){
	var button = $('#trip-resize-anchor i');
	var buttonClass = button.attr('class').split(' ').pop();
	var image = $('#trip-image');

	if (buttonClass == "fa-plus") {
		button.removeClass('fa-plus');
		button.addClass('fa-minus');
		image.removeClass('small-trip-image');
	} else {
		button.removeClass('fa-minus');
		button.addClass('fa-plus');
		image.addClass('small-trip-image');
	}
})