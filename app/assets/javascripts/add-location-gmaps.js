//<--------------Variable Declaration Start -------------->
var map;                // map variable for gmaps
var lat = -33.8665433;  // seattle lat
var long = 151.1956316; // seattle long
var mapResized = false; // variable to indicate when map should be recentered
//lgmaps variables
var place;
var backupPlace;
var autocomplete = false;
var InfoWindow;
var marker;
//location variables
var formLat;
var formLng;
var formName;
var formState;
var formCountry;
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
  //link input to the searchbox on the map
  var input = document.getElementById('gmaps-input');
  //initialize the autocomplete variable, infowindow, and marker.
  autocomplete = new google.maps.places.Autocomplete(input);
  infowindow = new google.maps.InfoWindow();
  marker = new google.maps.Marker({
    map: map,
    anchorPoint: new google.maps.Point(0, -29)
  });
  //close the infowindow to clear the map of clutter
  infowindow.close();
  //set the marker invisible
  marker.setVisible(true);
  
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
 
  
  //when the place is changed, trigger form update and marker placement, map 
  autocomplete.addListener('place_changed', function() {
    //set new place
    place = autocomplete.getPlace(); //set new place
    backupPlace = place;             //set new place other variable, shitty hack because wtf is going on

    
    //set the form variables using data from place
    
    formLat = place.geometry.location.lat();      
    formLng = place.geometry.location.lng();
    formName = place.name;

    if (place.address_components[2].long_name) {
      formState = place.address_components[2].long_name;
    } else {
      formState = "-";
    }

    if (place.address_components[3].long_name) {
      formCountry = place.address_components[3].long_name;
    } else {
      formCountry = "-"
    }
    

    //set the form values to new place information
    $('#loc-city').val(formName);
    $('#loc-state-province').val(formState);
    $('#loc-country').val(formCountry);
    $('#loc-lat').val(formLat);
    $('#loc-lng').val(formLng);

    //if place has geometry, then pan and set zoom at geometry
    if (backupPlace.geometry) {
       map.panTo(backupPlace.geometry.location);
       map.setZoom(15);
    } 
    //if the location exists, enable the add destination button
    if (backupPlace = "") {
      $('#add-dest-button').prop('disabled', true);
    } else {
      $('#add-dest-button').prop('disabled', false);
    }

    
    marker.setIcon({
      url: backupPlace.icon,
      size: new google.maps.Size(71, 71),
      origin: new google.maps.Point(0, 0),
      anchor: new google.maps.Point(17, 34),
      scaledSize: new google.maps.Size(35, 35)
    });
    
    


    marker.setPosition(place.geometry.location);
    var address = '';
    if (place.address_components) {
      address = [
        (place.address_components[0] && place.address_components[0].short_name || ''),
        (place.address_components[1] && place.address_components[1].short_name || ''),
        (place.address_components[2] && place.address_components[2].short_name || '')
      ].join(' ');
    }

    //possibly add later
    /*
    var openingHours = '';
    if (place.opening_hours.weekday_text) {
      openingHours = place.opening_hours.weekday_text.reduce( (prev, curr) => prev + '<br>' + curr);
    }
    */


    //set the content for the infowindow to display on the map
    infowindow.setContent('<div><strong>' + place.name + '</strong><br>' + address);
    //display the infowindow
    infowindow.open(map, marker);
  });

}

//function to recenter the map
function recenterMap() {
  map.panTo(new google.maps.LatLng(lat, long));
}

//function to clear the location data
function clearGmapLocation() {
  $('#gmaps-input').val("");
  $('#add-dest-button').prop('disabled', true);
}

//clear the autocomplete on click, clear location
$(document).on('click', '#gmaps-input',function(){
 clearGmapLocation(); 
});

//trigger redraw on modal click
$(document).on('click', '#location-button', function(){
  getLocation();
  clearGmapLocation();
  initialize();
  recenterMap();
})

$(document).on('click', '#add-dest-button', function() {
  $('#location-form').submit();
  $('#add-dest-button').prop('disabled', true);
  $('#trip-modal').modal('hide');
})

