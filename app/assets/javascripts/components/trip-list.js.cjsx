Table = ReactBootstrap.Table
Panel = ReactBootstrap.Panel

@TripList = React.createClass

  displayName: 'TripListReact'

  getInitialState: ->
    tripLocations: @props.data

  getDefaultProps: -> 
    tripLocations: []

  fetchLocations: ->
    trip_url_id = window.location.href.split("/").pop().split(" ").pop()
    fetchURL = '/locations/' + trip_url_id
    
    $.getJSON fetchURL, (data) => this.setState({tripLocations: data})

  componentWillMount: ->
    setInterval this.fetchLocations, 300
  
  render: ->
    <div>
      <div className="container-fluid">
        <h2 className="pull-left page-title">Trip Itinerary</h2>
        <span className="share-trip">
          <a href="#">
            <i class="fa fa-facebook"></i><span> </span>
          </a>
          <a href="#">
            <i className="fa fa-pinterest"></i>
          </a>
          <a href="#">
            <i className="fa fa-twitter"></i>
          </a>
          <a href="#">
            <i className="fa fa-reddit"></i>
          </a>
          <a href="#">
            <i className="fa fa-snapchat-ghost"></i>
          </a>
          <a href="#">
            <i className="fa fa-tumblr"></i>
          </a>
          <a href="#">
            <i className="fa fa-vine"></i>  
          </a>
        </span>
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
      </Table>
    </div>
