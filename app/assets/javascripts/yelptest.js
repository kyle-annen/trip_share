$(document).on("click", "#yelp-test", function(){


	$.getJSON("/yelp?location=chicago", function(data){
		$(".yelp-output").append(JSON.stringify(data));
	});


	
});