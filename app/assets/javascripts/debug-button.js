
//define the function for the debug button
//the debug button toggles debug information for viewing in the document.
var loadDebugButton = function(){
	//add id to the debug panel
	$(".debug_dump").attr('id', 'debug-panel');
	//hide the debug panel on load
	$("#debug-panel").addClass('hidden');
	//toggle the class hidden on the debug panel when the button is pressed
	$(document).on("click", "#debug-switch", function(){
		if ($("#debug-panel").hasClass('hidden')) {
			$("#debug-panel").removeClass('hidden');
			console.log("removing hidden");
		} else {
			$("#debug-panel").addClass('hidden');
			console.log("adding class hidden");
		}
	});
};

//load the js on page load
$(document).ready(loadDebugButton);
//load the js on turbolink transition
$(document).on('turbolinks:load', loadDebugButton);