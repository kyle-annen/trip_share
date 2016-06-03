var map;

function initialize() {
  var mapProp = {
    center:new google.maps.LatLng(51.508742,-0.120850),
    zoom:5,
    mapTypeId:google.maps.MapTypeId.ROADMAP
  };
  map = new google.maps.Map(document.getElementById("gmaps-canvas"), mapProp);
}


  
//trigger redraw on modal click
$(document).on('click', '#location-button', function(){
  
  initialize();
   
  google.maps.event.addListenerOnce(map, 'idle', function() {
    google.maps.event.trigger(map, 'resize');
  });

})

