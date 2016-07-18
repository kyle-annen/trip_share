Table = ReactBootstrap.Table
Panel = ReactBootstrap.Panel

@TripList = React.createClass

  displayName: 'TripListReact'

  getInitialState: ->
    didFetchData: false
    tripLocations: @props.data

  getDefaultProps: -> 
    tripLocations: []

  fetchLocations: ->
    trip_url_id = @state.tripLocations[1].trip_id
    fetchURL = '/locations/' + trip_url_id
    console.log 'logging fetchURL for api endpoint'
    console.log fetchURL
    $.getJSON fetchURL, (data) => this.setState({tripLocations: data})

  componentWillMount: ->
    setInterval this.fetchLocations, 300
  


  render: ->
    `<div className="container">
      <h2>Trip Itinerary</h2>
      <Table responsive>
        <thead>
          <tr>
            <th>City</th>
            <th>State / Province</th>
            <th>Country</th>
            <th>Latitude</th>
            <th>Longitude</th>
          </tr>  
        </thead>
        <tbody>
          { this.state.tripLocations.map((tripLocation) => <TripLocation key={tripLocation.id} tripLocation={tripLocation}/> )}
        </tbody>
      </Table>
    </div>`
