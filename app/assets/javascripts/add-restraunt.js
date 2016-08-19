

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
	$('#location-id').text(loc_id);
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
						$('#top-restaurants').hide().append(restaurant_tile(object)).fadeIn(500);
					});
				}
			});
		}
	});
	

});


function restaurant_tile(res_object) {
	var res = res_object.restaurant;
	var res_id = "res_id_" + res.id;
	var diner_id = "diner_id_" + res.id;
	var res_thumb = res.featured_image;
	var venue_name = res.name + ', ' + res_object.restaurant.location.locality;
	var venue_address = res.location.address;
	var venue_cuisines = res.cuisines.split(', ');
	var venue_price_range = Array(res.price_range + 1).join("$");
	var venue_price_amount =  res.currency + res.average_cost_for_two;
	var rating_style = 'style="background-color:#' + res.user_rating.rating_color + ';"'; 
	var rating_value = res.user_rating.aggregate_rating;
	var rating_text = res.user_rating.rating_text;
	var total_votes = res.user_rating.votes; 
	var cusine_tiles =	"";

	$.each(venue_cuisines, function(index, value) {
		var innerhtml = '<div class="cuisine-tile pull-left container-fluid">' + 
		value + '</div>';
		cusine_tiles += innerhtml;
	});


	var html = 	'' + 
	'<div class="restaurant-tile row">' +
		'<div class="col-md-4 col-sm-12 res-thumb-container">' +
			'<div class="rating-container" ' + rating_style + '>' +
				'<span class="res-venue-content res-venue-rating">' + 
					rating_value + " - " + rating_text +
				'</span>' +
				'<span class="res-venue-content pull-right res-venue-votes">' + "Votes: " + total_votes +
				'</span>' +
			'</div>' +
			'<img class="res-thumb img-responsive" src="' + res_thumb + '">' + 
			'</img>' + 
		'</div>' +
		'<div class="col-md-8 col-sm-12">' +
			'<div class="res-content col-md-6 col-sm-6">' +
				
				'<h3 class="res-venue-name">' + venue_name + '</h3>' +
				'<h6 class="res-venue-content">' + venue_address + '</h6>' +
				'<h6 class="res-venue-content">' + '</h6>' +
			'</div>' +
			'<div class="col-md-6 col-sm-6"></br>' +
				'<span class="res-venue-content price-range">' + venue_price_range + '  </span>' +
				'<span class="res-venue-content price-amount"> Cost for two: ' + venue_price_amount + '</span></br>' +
	
				'<form ' + 'id="diner_form_' + res.id + '">' +
				  '<div class="form-group" id="diner_form_group_' + res.id + '">' +
				    '<label for="diner_count">Number of people eating</label>' +
				    '<input type="text" class="form-control" id=' + diner_id + ' placeholder="Number of Guests">' +
				  '</div>' +
				'</form>' +
				'<button class="mui-btn mui-btn--raised mui-btn--primary add-food-tile-button"  id=' + res_id + '>' + 
					'Add Restaurant</button>' + 
			'</div>' +
		'</div>' +
		'<div class="row">' +
			'<div class="col-md-12">' +
				cusine_tiles +
			'</div>' +
		'</div>' +
	'</div>';

	return html;
} 

$(document).on('click', '.add-food-tile-button', function() {
	var add_res_button_id = $(this).attr('id');
	var res_id = parseInt(add_res_button_id.split('_').pop());
	var location_id = parseInt($('#location-id').text());
	var diner_form = "#diner_count_form_" + res_id;
	var diner_form_group = "#diner_form_group_" + res_id;

	var diner_ref = '#diner_id_' + res_id;
	var diner_count = Math.floor(parseInt($(diner_ref).val()));

	if ( isNaN(diner_count) == true) {
		$(diner_form_group).append('<h4 style="color: red">Enter a number please!</h4>');
	} else {
		$('#res-id-form').val(res_id);
		$('#res-diners-form').val(diner_count);
		$('#res-location-id-form').val(location_id);
		$('#submit-res-form-button').trigger('click');
		$('#food-modal').modal('hide');
		


	}

});
