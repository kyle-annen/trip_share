

$(document).on('click', '.add-restaurant-button', function() {
	$('#location-select').empty();
	$('#location-select').html('<h3 class="animate-flicker text-center">Loading..</h3>');

	var loc_id = $(this).attr('id').split('-').pop();
	
	var query = $('#location-city-' + loc_id).attr('class').split("_").pop();
	console.log("----New Zomato Locations Query----")
	console.log("query: " + query);
	
	var lat = $('#location-lat-' + loc_id).attr('class').split("_").pop();
	console.log("lat: " + lat);
	
	var lon = $('#location-lon-' + loc_id).attr('class').split("_").pop();
	console.log("lon: " + lon);
	
	var restaurants_url = "/zomato?api_type=locations" + 
	"&query=" + query + 
	"&lat=" + lat + 
	"&lon=" + lon;
	
	var locations;

	$.ajax({
		dataType: "json",
		url: restaurants_url,
		success: function(data) { 
			$('#location-select').empty();
			locations = data; 
			console.log(locations[0]);

			$('#location-select').append(JSON.stringify(locations, null, '  '));
		}
	})
	
});



	
