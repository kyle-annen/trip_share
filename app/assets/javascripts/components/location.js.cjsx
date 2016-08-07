@TripLocation = React.createClass
  render: ->
    <tbody>
	    <tr className={'location-row-' + this.props.tripLocation.id}>
	      <td> {this.props.tripLocation.city} </td>
	      <td> {this.props.tripLocation.lat} </td>
	      <td> {this.props.tripLocation.long} </td>
	      <td> <i className="fa fa-bars location-menu-button" aria-hidden="true" id={"location-menu-button-" + @props.tripLocation.id}></i></td>
	    </tr>
	    <tr className={'aria-hidden location-menu-bar hidden ' + 'location-row-' + this.props.tripLocation.id} id={'location-menu-bar-' + this.props.tripLocation.id}>
	      <td>
	        <button type="button" className="mui-btn mui-btn--raised mui-btn--primary hidden" data-toggle="modal" data-target="" id="location-button">
	        <span className="fa fa-plane" aria-hidden="true"></span></button>
	      
	        <button type="button" className="mui-btn mui-btn--raised mui-btn--primary hidden" data-toggle="modal" data-target="" id="">
	        <span className="fa fa-bed" aria-hidden="true"></span></button>  
	      
	        <button type="button" className="mui-btn mui-btn--raised mui-btn--primary hidden" data-toggle="modal" data-target="" id="location-button">
	        <span className="fa fa-cutlery" aria-hidden="true"></span></button>
	         
	        <button type="button" className="mui-btn mui-btn--raised mui-btn--small mui-btn--danger location-button-delete" data-toggle="modal" data-target="#delete-modal" id={'location-button-delete-' + this.props.tripLocation.id}>
	        <span> </span><span className="fa fa-times" aria-hidden="true"></span></button>  
	      </td>
	      <td></td>
	      <td></td>
	      <td></td>
	    </tr>	
    </tbody>
