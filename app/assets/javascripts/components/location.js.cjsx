@TripLocation = React.createClass
  render: ->
    <tbody>
	    <tr>
	      <td> {this.props.tripLocation.city} </td>
	      <td> {this.props.tripLocation.lat} </td>
	      <td> {this.props.tripLocation.long} </td>
	      <td> <i className="fa fa-bars" aria-hidden="true"></i></td>
	    </tr>
	    <tr className="aria-hidden hidden">
	      <td>
	        <button type="button" className="mui-btn mui-btn--raised mui-btn--primary" data-toggle="modal" data-target="#trip-modal" id="location-button">
	        <span className="fa fa-plane" aria-hidden="true"></span> Add Travel</button>
	      </td>
	      <td>
	        <button type="button" className="mui-btn mui-btn--raised mui-btn--primary" data-toggle="modal" data-target="" id="">
	        <span className="fa fa-bed" aria-hidden="true"></span> Add Accomodation</button>  
	      </td>
	      <td>  
	        <button type="button" className="mui-btn mui-btn--raised mui-btn--primary" data-toggle="modal" data-target="#trip-modal" id="location-button">
	        <span className="fa fa-cutlery" aria-hidden="true"></span> Add Restraunt</button>
	      </td>
	      <td>      
	        <button type="button" className="mui-btn mui-btn--raised mui-btn--primary" data-toggle="modal" data-target="#trip-modal" id="location-button">
	        <span className="fa fa-calendar" aria-hidden="true"></span> Add Event</button>  
	      </td>
	      <td>
	        <button type="button" className="mui-btn mui-btn--raised mui-btn--primary" data-toggle="modal" data-target="#trip-modal" id="location-button">
	        <span className="fa fa-ticket" aria-hidden="true"></span> Get Tickets</button>
	      </td>
	    </tr>	
    </tbody>
 