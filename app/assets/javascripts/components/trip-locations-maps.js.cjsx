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
    setInterval(@fetchLocations, 300)

  componentDidMount: ->
    # create the map, marker and infoWindow after the component has
    # been rendered because we need to manipulate the DOM for Google =(
    @bounds = new google.maps.LatLngBounds();
    @loc_map = @createMap()
    #@loc_infoWindow = @createInfoWindow()
    # have to define google maps event listeners here too
    # because we can't add listeners on the map until its created
    google.maps.event.addListener @loc_map, 'zoom_changed', => @handleZoomChange()
    google.maps.event.addListener @loc_map, 'dragend', => @handleDragEnd()
    @locationNumbers = 0
    setInterval(@updateMarkers, 300)

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

  createMarker: (location, locNum)->
    
    iconSrc = 'http://chart.apis.google.com/chart?chst=d_map_pin_letter&chld=' + locNum + '|FE6256|000000'
    marker = new google.maps.Marker
      position: new google.maps.LatLng(location.lat, location.long)
      map: @loc_map
      icon: iconSrc
    @bounds.extend(marker.getPosition())
    @loc_map.fitBounds(@bounds)

  updateMarkers: ->
    
    if (typeof @state.tripLocations[0] != 'undefined' && @locationNumbers < @state.tripLocations.length) 
      locNum = null
      for num in [0...@state.tripLocations.length]
        locNum = num + 1
        location = @state.tripLocations[num]
        @createMarker(location, locNum)
      @locationNumbers = @state.tripLocations.length

  
  



  createInfoWindow: ->
    contentString = ("<div class='InfoWindow'>" + this.state.tripLocations[0].city + "</div>")
    infoWindow = new google.maps.InfoWindow
      map: @loc_map
      anchor: @loc_marker
      content: contentString




  handleZoomChange: ->
    

  handleDragEnd: ->
    
    