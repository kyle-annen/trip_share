

$(document).on('click', '.add-restaurant-button', function() {
	$('#location-select').empty();
	$('#location-select').html('<h3 class="animate-flicker text-center">Filling up beer mugs...</h3>');

	var loc_id = $(this).attr('id').split('-').pop();	
	var query = $('#location-city-' + loc_id).attr('class').split("_").pop();
	var lat = $('#location-lat-' + loc_id).attr('class').split("_").pop();
	var lon = $('#location-lon-' + loc_id).attr('class').split("_").pop();
	var locations_url = "/zomato?api_type=locations" + 
	"&query=" + query + 
	"&lat=" + lat + 
	"&lon=" + lon;
	
	var locations;
	var location_details;

	$.ajax({
		dataType: "json",
		url: locations_url,
		success: function(data) { 
			locations = data;
			var entity_type = locations[0].entity_type;
			var entity_id = locations[0].entity_id;

			

			var restaurants_url = "/zomato?api_type=location_details" +
			"&entity_id=" + entity_id +
			"&entity_type=" + entity_type;

			$.ajax({
				dataType: "json",
				url: restaurants_url,
				success: function(data) {
					location_details = data;
					$('#location-select').empty();
					$('#location-select').append(JSON.stringify(location_details, null, '  '));
				}
			});
		}
	});
	

});





	
