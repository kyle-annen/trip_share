var toggleMenus = function() {
	buttonId = $(this).attr('id').split('-').pop();
	menuBarId = '#location-menu-bar-' + buttonId;
	console.log(menuBarId);
	$(menuBarId).toggleClass('hidden');
}


$(document).on('click','.location-menu-button', toggleMenus);


