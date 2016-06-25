//<--------------Variable Declaration Start -------------->
var map;                // map variable for gmaps
var lat = -33.8665433;  // seattle lat
var long = 151.1956316; // seattle long
var mapResized = false; // variable to indicate when map should be recentered
//location variables
var place;
var autoComplete;
//<--------------Variable Declaration End ---------------->


//<--------------Geolocation Start ----------------------->
//get coordinates
function getLocation() {
  //if geolocation is available, set to location, otherwise default to seattle
  if (navigator.geolocation) {
    navigator.geolocation.getCurrentPosition(setLatLong);
  }
}

//set the latititude and longitude variable to the gmaps center tag format
function setLatLong (position) {
  lat = position.coords.latitude;
  long = position.coords.longitude;
}
//<--------------Geolocation End ------------------------->



//initialize google map
function initialize() {
  //properties for the gmap
  var mapProp = {
    center:new google.maps.LatLng(lat, long), //use the latlng set by get location
    zoom:15,
    mapTypeId:google.maps.MapTypeId.ROADMAP
  };
  //set the map object to map variable
  map = new google.maps.Map(document.getElementById("gmaps-canvas"), mapProp);
  autoComplete = new google.maps.places.Autocomplete(document.getElementById('gmaps-input'));
}

//funciton to recenter the map
function recenterMap() {
  map.panTo(new google.maps.LatLng(lat, long));
}

//listener for 


//on document load, get the geolocation if available
$(document).ready(function(){
  getLocation();
  initialize();
})

//trigger redraw on modal click
$(document).on('click', '#location-button', function(){

  
  

  //redraw map once when modal is opened
  google.maps.event.addListenerOnce(map, 'idle', function() {
    google.maps.event.trigger(map, 'resize');
    mapResized = true; //indicates that the map has been resized
  });

  //recenter  map if map changed size
  google.maps.event.addListener(map, 'bounds_changed', function(){
    if (mapResized) {
      recenterMap(); //recenter the map on the geolocation variables
    }
    mapResized = false; //set the resize event variable to false
  });

  

  google.maps.event.addListener(autoComplete, 'place_changed', function() {
    place = autocomplete.getPlace();
    if (place.geometry) {
       map.panTo(place.geometry.location);
       map.setZoom(15);
    } 
});

  recenterMap();

})



