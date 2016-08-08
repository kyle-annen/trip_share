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

//when delte button is clicked, location id is passed to the class of the modal delete
$(document).on('click', '.location-button-delete', function(){
	locNum = $(this).attr('id').split('-').pop();
	locationId = 'confirm-delete-location-' + locNum;
	console.log('location id to add to delete confirmation button: ' + locationId);
	$('.confirm-delete-location-button').attr('id', locationId);
	locCity = $('#location-city-' + locNum).attr('class').split('-').pop();
	$('#delete-modal-content').html(locCity);

});


$(document).on('click', '.confirm-delete-location-button', function() {
	locNum = $(this).attr('id').split('-').pop();
	delUrl = '/locations/' + locNum;
	$.ajax({
		method: 'DELETE',
		url: delUrl, 
		dataType: 'JSON'
	})
	console.log('record should be deleted');
});
