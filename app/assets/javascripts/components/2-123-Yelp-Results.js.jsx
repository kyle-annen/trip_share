var YelpResultRow = React.createClass({
	
	render: function() {
		return(
			<div className="row">
				<div className="col-md-3">
					<img src={this.props.business.image_url} className="img-responsive" />
				</div>
				<div className="col-md-3">
					<h3>{this.props.business.name}</h3>
				</div>
			</div>

		);
	}	
});