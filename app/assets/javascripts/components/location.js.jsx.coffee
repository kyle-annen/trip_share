@TripLocation = React.createClass
  render: ->
    `<tr>
      <td> {this.props.tripLocation.city} </td>
      <td> {this.props.tripLocation.country} </td>
      <td> {Date(Date.parse(this.props.tripLocation.arrival_date_time))} </td>
     </tr>`
                  
