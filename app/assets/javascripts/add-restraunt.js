//zomato api for restraunt adding
// turns out the request needs to be made by the server, need to rewrite in ruby in food controller?
var zomatoAPI = function(query, lat, lon, count) {
	//variables for api
	var apiKey = "f47a72ab00afe64aab78b9919ee3d427";
	var baseURL = "https://developers.zomato.com/api/v2.1/";
	var location = "locations?";
	var queryTag = "&query=";
	var latTag = "&lat=";
	var lonTag = "&lon=";
	var countTag = "&count=";
	//returns the JSON object for the location based on Zomatos documentation
	//https://developers.zomato.com/documentation#!/location/locations
	var locationURL = baseURL + queryTag + query + latTag + lat + lonTag + lon + countTag + count;

	var location = $.ajax({
		xhrFields: {
        	withCredentials: true
    	},
		type: 'GET',
		headers: {
			'Accept': 'application/json',
            'user_key': apiKey
		},
		url: locationURL
	}).done(function(data){
		return data;
	});

	console.log(location);

};





	
