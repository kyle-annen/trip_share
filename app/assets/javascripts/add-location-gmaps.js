var map;                // map variable for gmaps
var lat = -33.8665433;  // seattle lat
var long = 151.1956316; // seattle long
var mapResized = false; // variable to indicate when map should be recentered

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




//initialize google map
function initialize() {
  //properties for the gmap
  var mapProp = {
    center:new google.maps.LatLng(lat, long), //use the latlng set by get location
    zoom:12,
    mapTypeId:google.maps.MapTypeId.ROADMAP
  };
  //set the map object to map variable
  map = new google.maps.Map(document.getElementById("gmaps-canvas"), mapProp);
}

function recenterMap() {
  map.panTo(new google.maps.LatLng(lat, long));
}

$(document).ready(function(){
  getLocation();
})

//trigger redraw on modal click
$(document).on('click', '#location-button', function(){
  
  
  //gmaps initialization
  initialize();
   
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

  recenterMap();

  

})

