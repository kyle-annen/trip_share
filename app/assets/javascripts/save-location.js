// javascript function to access the location data as returned from the 
$(document).ready(function($) {

  //get data, save, and close and clear search field
  $('#submit-location-btn').click(function() {
    //pull data from html
    var InputAddress = document.getElementById('gmaps-input-address').value;
    var InputLat = document.getElementById('gmaps-output-latitude').value;
    var Inputlong = document.getElementById('gmaps-output-longitude').value;

    //pass variables to rails via html arguments if all exist
    if ( $('gmaps-input-address').value &&
        $('gmaps-output-latitude').value &&
        $('gmaps-output-longitude').value ) {
      window.open("/controller/create?city="+InputAddress+"&lat"+InputLat+"&long"+InputLong,"_self");
    }
    else
    {
      alert("Cancelled");
    }

      


    //close accordio on save
    $('#accordion-close').slideUp('slow');

    //clear form on exit
    $('#gmaps-input-address').val("");
    


  });

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

    });

//  if ( !$('#gmaps-input-address').val() || 
//      !$('#gmaps-output-latitude').val() || 
//      !$('#gmaps-output-longitude').val() ) {
//    $('#subit-loctation-btn').addClass('disabled');
//  });



  
  
});



        


    
    
    




  
