Table = ReactBootstrap.Table
Panel = ReactBootstrap.Panel

@TripList = React.createClass

  displayName: 'TripListReact'

  getInitialState: ->
    tripLocations: @props.data

  getDefaultProps: -> 
    tripLocations: []

  fetchLocations: ->
    trip_url_id = @state.tripLocations[1].trip_id
    fetchURL = '/locations/' + trip_url_id
    
    $.getJSON fetchURL, (data) => this.setState({tripLocations: data})

  componentWillMount: ->
    setInterval this.fetchLocations, 300
  
  render: ->
    <div>
      <div className="container-fluid">
        <h2 className="pull-left">Trip Itinerary</h2>
        <span><button type="button" className="mui-btn mui-btn--raised mui-btn--primary pull-right location-button" data-toggle="modal" data-target="#trip-modal" id="location-button">
        <span className="fa fa-globe" aria-hidden="true"></span> Add Destination</button></span>
      </div>
      <Table responsive>
        <thead>
          <tr>
            <th>City</th>
            <th>Latitude</th>
            <th>Longitude</th>
            <th></th>
          </tr>  
        </thead>
          { this.state.tripLocations.map((tripLocation) => <TripLocation key={tripLocation.id} tripLocation={tripLocation}/> )}
          { this.state.tripLocations.map((tripLocation) => <LocationButtons key={tripLocation.id} tripLocation={tripLocation}/> )}
      </Table>
    </div>
