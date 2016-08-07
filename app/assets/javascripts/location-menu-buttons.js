//html exists components > location
//function to toggle the class hidden on each row of the location table



//listener for the click, and callback to toggleMenus js
$(document).on('click','.location-menu-button', function() {
	buttonId = $(this).attr('id').split('-').pop();
	menuBarId = '#location-menu-bar-' + buttonId;
	console.log(menuBarId);
	$(menuBarId).toggleClass('hidden');
});

//functions for the delete button

$(document).on('click', '.location-button-delete', function(){
	locNum = $(this).attr('id').split('-').pop();
	locationId = 'confirm-delete-location-' + locNum;
	console.log('location id to add to delete confirmation button: ' + locationId);
	$('.confirm-delete-location-button').attr('id', locationId);
});


$(document).on('click', '.confirm-delete-location-button', function() {
	locNum = $(this).attr('id').split('-').pop();
	
});
