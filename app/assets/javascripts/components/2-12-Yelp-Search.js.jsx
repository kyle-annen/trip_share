var YelpSearch = React.createClass({

	render: function() {
		return(
			<div>

				<div className="input-group">

					<input type="text" className="form-control" placeholder="Search for..." onChange={this.props.handleTyping}></input>

						<span className="input-group-btn">
						<div className="btn btn-default" type="button">Search</div>
					</span>
				</div>

				<div className="container-fluid">
					{this.props.result.businesses.map((business, index) => 
						<YelpResultRow business={business} key={business.id} />
					)}						
				</div>
			</div>
		);
	}
});