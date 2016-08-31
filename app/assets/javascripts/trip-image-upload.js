var croppedImage;
var cropdata = {};

 
$(document).ready(function() {
	var tripImage = document.getElementById('trip-image-upload');
	var previewImage = document.getElementById('trip-image-preview');
	var result = document.getElementById('trip-image-upload-result');
	var cropButton = document.getElementById('crop-image-button');
	var warning = document.getElementById('image-upload-warning');

	tripImage.addEventListener('change', function() {
		var file = this.files[0];

		if (file.type.indexOf('image') < 0) {
	      res.innerHTML = 'wrong filetype';
	      return;
	  }


		var fileReader = new FileReader();

		fileReader.onload = function() {

			previewImage.src = fileReader.result;
			$('#trip-image-preview').toggleClass('hidden');
			$('#crop-image-button').toggleClass('hidden');
			$('#trip-image-reupload').toggleClass('hidden');
			$('.btn-file').toggleClass('hidden');

			
		}

		fileReader.readAsDataURL(file);
	});

	function getBase64Image(img) {
	    var canvas = document.createElement("canvas");
	    canvas.width = img.width;
	    canvas.height = img.height;

	    var ctx = canvas.getContext("2d");
	    ctx.drawImage(img, 0, 0);

	    var dataURL = canvas.toDataURL("image/png");

	    return dataURL.replace(/^data:image\/(png|jpg);base64,/, "");
	}


	$(document).on('click', '#crop-image-button', function(event){
		event.preventDefault();
		$('#crop-image-button').toggleClass('hidden');
		$('#use-cropped-image-button').toggleClass('hidden');
		$('#trip-image-preview').cropper({
		  aspectRatio: 3 / 2,
		  minCropBoxWidth: 600,
		  minCropBoxHeight: 400,
		  zoomable: false,
		  crop: function(e) {
		  	cropdata.x = e.x;
		    cropdata.y = e.y;
		    cropdata.width = e.width;
		    cropdata.height = e.height;
		    cropdata.rotate = e.rotate;
		    cropdata.scaleX = e.scaleX;
		    cropdata.scaleY = e.scaleY;

		    
		  }  		  
		});
	});


	$(document).on('click', '#use-cropped-image-button', function(event){
		event.preventDefault();
		$('#trip-cropdata-field').val(JSON.stringify(cropdata));
		console.log(JSON.stringify(cropdata));
		// localStorage.setItem('cropPP', croppedImage));
		//hide buttons and reveal form
		$('#trip-image-preview').toggleClass('hidden');
		$('#trip-form-name').toggleClass('hidden');
		$('#trip-form-blurb').toggleClass('hidden');
		$('#trip-image-preview').toggleClass('hidden');
		$('#submit-trip-button').toggleClass('hidden');
		$('.cropper-container').toggleClass('hidden');
		$('#use-cropped-image-button').toggleClass('hidden');
	});

	// js to hide / show parts of image upload
	$(document).on('click', '#trip-image-reupload', function(event) {

	})

	//fetch the image stored to local storage
	function fetchimage (imageName) {
	    var dataImage = localStorage.getItem(imageName);
	    img.src = "data:image/png;base64," + dataImage;
	}




});




