var TripPage = React.createClass({

	getInitialState: function() {
    return {
      trip: this.props.data,
      result: {businesses: []}
    };
  },

  getDefaultProps: function() {
    return {
      trip: [],
      result: []
    };
  },

  fetchTrip: function() {
    var fetchURL, trip_url_id;
    trip_url_id = window.location.href.split("/").pop().split(" ").pop();
    fetchURL = '/locations/' + trip_url_id;
    return $.getJSON(fetchURL, (function(_this) {
      return function(data) {
        return _this.setState({
          trip: data
        });
      };
    })(this));
  },

  fetchYelpSearch: function(search_term) {
    var search_url;
    search_url = "/yelp?location=" + search_term;
    return $.getJSON(search_url, (function(_this) {
      return function(data) {
        return _this.setState({
          result: data
        });
      };
    })(this));
  },
  
  componentWillMount: function() {
    return setInterval(this.fetchTrip, 300);
  },

  handleTyping: function(event) {
    this.fetchYelpSearch(event.target.value);
  },

	render: function() {

		return(
      <div>
  			<div className="container-fluid margin-top">
  				<div className="row">
  					<div className="col-md-3 offset-md-1">
  						<img src={this.state.trip.image_url}></img>
  					</div>
  					<div className="col-md-3">
              <div className="row">
  						  <h2>{this.state.trip.blurb}</h2>
              </div>
              <div className="row">
                <div type="button" className="btn btn-info btn-lg" data-toggle="modal" data-target="#myModal">Add Establishment</div>
              </div>
  					</div>
  				</div>
  			</div>
        <YelpModal handleTyping={this.handleTyping} result ={this.state.result} />
      </div>
		);
	}
});