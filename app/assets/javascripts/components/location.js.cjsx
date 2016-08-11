@TripLocation = React.createClass
  render: ->
    <tbody className="table table-hover table-striped">
	    <tr className={'location-row-' + this.props.tripLocation.id}>
	      <td id={'location-city-' + this.props.tripLocation.id} className={'city_' + this.props.tripLocation.city}> {this.props.tripLocation.city} </td>
	      <td id={'location-lat-' + this.props.tripLocation.id} className={'lat_' + this.props.tripLocation.lat}> {this.props.tripLocation.lat} </td>
	      <td id={'location-lon-' + this.props.tripLocation.id} className={'lon_' + this.props.tripLocation.long}> {this.props.tripLocation.long} </td>
	      <td> <i className="fa fa-bars location-menu-button" aria-hidden="true" id={"location-menu-button-" + @props.tripLocation.id}></i></td>
	    </tr>
	    <tr colSpan="3" className={'aria-hidden location-menu-bar hidden location-button-row ' + 'location-row-' + this.props.tripLocation.id} id={'location-menu-bar-' + this.props.tripLocation.id}>
	      <td>
	        <button type="button" className="mui-btn mui-btn--raised mui-btn--primary" data-toggle="modal" data-target="" id="location-button">
	        <span className="fa fa-plane" aria-hidden="true"></span></button>
	      
	        <button type="button" className="mui-btn mui-btn--raised mui-btn--primary" data-toggle="modal" data-target="" id="">
	        <span className="fa fa-bed" aria-hidden="true"></span></button>  
	      
	        <button type="button" className="mui-btn mui-btn--raised mui-btn--primary add-restaurant-button" data-toggle="modal" data-target="#food-modal" id={'add-restaurant-button-' + this.props.tripLocation.id}>
	        <span className="fa fa-cutlery" aria-hidden="true"></span></button>
	         
	      </td>
	      <td></td>
	      <td></td>	
	      <td>
	      	<button type="button" className="mui-btn mui-btn--raised mui-btn--small mui-btn--danger location-button-delete" data-toggle="modal" data-target="#delete-modal" id={'location-button-delete-' + this.props.tripLocation.id}>
	        <span> 	</span><span className="fa fa-times" aria-hidden="true"></span></button>
	      </td>
	    </tr>	
    </tbody>
