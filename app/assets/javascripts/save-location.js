// javascript function to access the location data as returned from the 
$(document).ready(function($) {
  //Copy location, lat and long to rails form 

  //when search field is clicked it is cleared
  $('#gmaps-input-address').on("focus", function() {
    $('#gmaps-input-address').val("");
  });

  $('#accordion').find('.accordion-toggle').click(function(){
      //Expand or collapse this panel
      $(this).next().slideToggle('slow');
      //Hide the other panels
      $(".accordion-content").not($(this).next()).slideUp('slow');
      //clear fields on open
      $('#gmaps-input-address').val(""); 
      $('#gmaps-output-latitude').val(""); 
      $('#gmaps-output-longitude').val(""); 
      google.maps.event.trigger(gmaps-canvas, 'resize');
    });




  $('#gmaps-input-address').keyup(function() {

    $('#location_city').val($('#gmaps-input-address').val());
    $('#location_lat').val($('#gmaps-output-latitude').val());
    $('#location_long').val($('#gmaps-output-longitude').val());
  });

  


});
