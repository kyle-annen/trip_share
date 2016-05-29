var loadDebugButton = function(){
	$(".debug_dump").attr('id', 'debug-panel');
	$("#debug-panel").addClass('hidden');
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


$(document).ready(loadDebugButton);
$(document).on('page:load', loadDebugButton);