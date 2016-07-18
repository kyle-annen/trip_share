@TripLocation = React.createClass
  render: ->
    `<tr>
      <td> {this.props.tripLocation.city} </td>
      <td> {this.props.tripLocation.state_province} </td>
      <td> {this.props.tripLocation.country} </td>
      <td> {this.props.tripLocation.lat} </td>
      <td> {this.props.tripLocation.long} </td>
     </tr>`

