var TripPage = React.createClass({

	getInitialState: function() {
    return {
      trip: this.props.data
    };
  },

  getDefaultProps: function() {
    return {
      trip: []
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

  componentWillMount: function() {
    return setInterval(this.fetchTrip, 300);
  },

	render: function() {
		return(
			<div className="container-fluid margin-top">
				<div className="row">
					<div className="col-md-3 offset-md-1">
						<img src={this.state.trip.image_url}></img>
					</div>
					<div className="col-md-3">
						<h2>{this.state.trip.blurb}</h2>
					</div>
				</div>
			</div>
		);
	}
});