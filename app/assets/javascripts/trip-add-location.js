$("#trip-modal").on("shown.bs.modal", function () {
    google.maps.event.trigger(map, "resize");
});