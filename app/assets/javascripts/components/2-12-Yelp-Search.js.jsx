var YelpSearch = React.createClass({

	getInitialState: function() {
		return {
			search_term: "",
			params: "",
			result: ""
		};
	},



	render: function() {
		return(
			<div>

				<div className="input-group">
					<input type="text" className="form-control" 
					placeholder="Search for..." onChange={this.props.handleTyping}>
						
					</input>
						<span className="input-group-btn">
						<div className="btn btn-default" type="button">Search</div>
					</span>
				</div>

				<div></div>
			</div>
		);
	}
});