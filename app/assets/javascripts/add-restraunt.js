

$(document).on('click', '.add-restaurant-button', function() {
	$('.kegContainer').removeClass('hidden');
	$('#location-select').empty();
	$('#restaurant-display-title').empty();
	$('#top-restaurants').empty();
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

	//variable declarations for filtering restaurants
	var current_area;
	var top_restaurants;
	var food_types;
	var food_cost;
	var filter_food_types;
	var filter_food_cost;


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
					current_area = location_details.subzone + "'s Top Rated Restaurants";
					top_restaurants = location_details.best_rated_restaurant
					$('.kegContainer').addClass('hidden');
					$('#location-select').empty();
					$('#top-restaurants').empty();
					console.log(current_area);	
					$('#restaurant-display-title').text(current_area);
					$.each(top_restaurants, function(index, object) {
						$('#top-restaurants').hide().append(restraunt_tile(object)).fadeIn(500);
					});
				}
			});
		}
	});
	

});


function restraunt_tile(res_object) {
	var res_id = "res_id_" + res_object.restaurant.res_id;
	var res_thumb = res_object.restaurant.featured_image;
	var html = 	'' + 
	'<div class="restaurant-tile row" id=' + res_id + '>' +
		'<div class="col-md-4 res-thumb-container">' +
			'<img class="res-thumb img-responsive" src="' + res_thumb + '">' + 
			'</img>' + 
		'</div>' +
		'<div class="res-content col-md-8">' +
		'</div>' +
	'</div>';

	return html;
} 





	
