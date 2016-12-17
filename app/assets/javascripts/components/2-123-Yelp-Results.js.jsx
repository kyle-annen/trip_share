var YelpResultRow = React.createClass({
	
	render: function() {
		var business = this.props.business;
		var openStatus = null;
			var isClosed = this.props.business.is_closed;
		if (isClosed == "true") {
			openStatus = <p className="yelp-closed">Closed</p>;
		} else {
			openStatus = <p className="yelp-open">Open</p>;
		}

		return(
			<div className="container-fluid">
				<div className="row yelp-result-row">
					<div className="container-fluid">
						<div className="row yelp-info-margin">
							<div className="col-md-3">
								<img src={business.image_url} className="img-responsive" />
							</div>
							<div className="col-md-9">

								<div className="container-fluid">
								<a href={business.url} ><p className="bold">{business.name}</p></a>
									<div className="row">
										<div className="col-md-6">
											<p> Rating: <img src={business.rating_img_url} /></p>
											<p> Reviews: {business.review_count} </p>
											{openStatus}
										</div>
										<div className="col-md-6">
											{/* map over the different address lines and format */}
											{business.location.display_address.map((address_line) => 
												<p className="address-line-height">{address_line}</p> 
											)}
										{/* display the business phone number */}
											<p> {business.display_phone} </p>
											
										</div> 
									</div>
								</div>

		 					</div>
		 				</div>
	 				</div>
				</div>
			</div>

		);
	}	
});