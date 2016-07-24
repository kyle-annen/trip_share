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
    trip_url_id = @state.tripLocations[0].trip_id
    fetchURL = '/locations/' + trip_url_id
    
    $.getJSON fetchURL, (data) => this.setState({tripLocations: data})

  componentWillMount: ->
    setInterval(this.fetchLocations, 300)



  componentDidMount: ->
    # create the map, marker and infoWindow after the component has
    # been rendered because we need to manipulate the DOM for Google =(
    @loc_map = @createMap()
    
    
    @loc_marker = @createMarker()
    @loc_infoWindow = @createInfoWindow()
    
    # have to define google maps event listeners here too
    # because we can't add listeners on the map until its created
    google.maps.event.addListener @loc_map, 'zoom_changed', => @handleZoomChange()
    google.maps.event.addListener @loc_map, 'dragend', => @handleDragEnd()

  createMap: ->
    mapOptions =
      minZoom: 9
      zoom: 10
      center: new google.maps.LatLng(this.state.tripLocations[0].lat, this.state.tripLocations[0].long)
      
        
      
    new google.maps.Map(@refs.trip_map_canvas.getDOMNode(), mapOptions)

  createMarker: ->
      marker = new google.maps.Marker
        position: new google.maps.LatLng(this.state.tripLocations[0].lat, this.state.tripLocations[0].long)
        map: @loc_map

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