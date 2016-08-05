@TripLocationMap = React.createClass
  map: null
  marker: null
  infoWindow: null

  render: ->
    <div className="GMap">
      <div ref="trip_map_canvas" id="trip_map_canvas">
      </div>
    </div>

  getInitialState: ->
    tripLocations: @props.data

  fetchLocations: ->
    trip_url_id = window.location.href.split("/").pop().split(" ").pop()
    fetchURL = '/locations/' + trip_url_id
    
    $.getJSON fetchURL, (data) => @setState({tripLocations: data})

  componentWillMount: ->
    setInterval @fetchLocations, 300

  componentDidMount: ->
    # create the map, marker and infoWindow after the component has
    # been rendered because we need to manipulate the DOM for Google =(
    console.log(typeof @state.tripLocations[0])

    @bounds = new google.maps.LatLngBounds();
    @loc_map = @createMap()
    #@loc_infoWindow = @createInfoWindow()
    if typeof @state.tripLocations[0] != 'undefined'
      for location in @state.tripLocations
        @createMarker(location)
    @markerCount = @state.tripLocations.length
    # have to define google maps event listeners here too
    # because we can't add listeners on the map until its created
    google.maps.event.addListener @loc_map, 'zoom_changed', => @handleZoomChange()
    google.maps.event.addListener @loc_map, 'dragend', => @handleDragEnd()

    

  
    setInterval @updateMarkers, 300

  createMap: ->
    if typeof this.state.tripLocations[0] == 'undefined'
      initLat = 0
      initLong = 0
    else
      initLat = this.state.tripLocations[0].lat
      initLong = this.state.tripLocations[0].long
    mapOptions =
      zoom: 10
      center: new google.maps.LatLng(initLat, initLong)
      streetViewControl: false
    new google.maps.Map(@refs.trip_map_canvas.getDOMNode(), mapOptions)

  createMarker: (location)->
    
    marker = new google.maps.Marker
      position: new google.maps.LatLng(location.lat, location.long)
      map: @loc_map
    @bounds.extend(marker.getPosition())
    @loc_map.fitBounds(@bounds)

  updateMarkers: ->
      locCount = @state.tripLocations.length
      console.log('markerCount = ' + @markerCount)
      console.log('locCount = ' + locCount)
      console.log('range = ' + @markerCount - 1 + "-" + locCount - 1)
      if @markerCount < locCount
        for num in [@markerCount - 1...locCount]
          @createMarker(@state.tripLocations[num])
        @markerCount = locCount

  createInfoWindow: ->
    contentString = ("<div class='InfoWindow'>" + this.state.tripLocations[0].city + "</div>")
    infoWindow = new google.maps.InfoWindow
      map: @loc_map
      anchor: @loc_marker
      content: contentString

  handleZoomChange: ->
    # something happens when the zoom changes
    # this is where it's handled

  handleDragEnd: ->
    # something else happens when the map is dragged somewhere
    # this is where that's handled