@TripListLocationRowRestaurantRow = React.createClass
  
  getInitialState: ->
  	res = null
  getRestaurantDetails: (res_id)->
  	response = ""
  	res_url = "/zomato?api_type=restaurant_details&res_id=" + res_id
  	$.ajax
  		url: res_url
  		dataType: "json"
  		async: false
  		success: (data) ->
  			response = data.restaurant_details		
  	@setState({res: response})
  	console.log(response)
    

  	

  componentWillMount: ->
  	@getRestaurantDetails(parseInt(@props.restaurant.res_id))
  
  	



  render: ->
  	
  	<tr className="no-border">
  		<td colSpan=4 className="no-border">
  			<div className="container-fluid ">
  				<div className="row res-row">
  					<div className="col-sm-6 col-md-2">
  						<img className="img-responsive img-rounded" src={@state.res.thumb}/>
  					</div>
  					<div className="col-sm-6 col-md-3">
  						<span className="res-row-name">{@state.res.name}</span><br/>
  						<span>{@state.res.location.address}</span><br/>
  					</div>
  					<div className="col-sm-6 col-md-4">
  						<span>User Rating: {@state.res.user_rating.aggregate_rating}</span><br/>
  						<span className="res-row-rating-text" style={color: '#' + @state.res.user_rating.rating_color.toString()}>{@state.res.user_rating.rating_text}</span><br/>
  						<span>Votes: {@state.res.user_rating.votes}</span>
  					</div>
  					<div className="col-sm-6 col-md-3">
  						<span>People Eating: {@props.restaurant.diners}</span><br/>
  						<span>Total Estimate: {@state.res.currency}{@props.restaurant.diners * @state.res.average_cost_for_two / 2}</span>

  					</div>
  				</div>
  			</div>
  		</td>
		</tr>