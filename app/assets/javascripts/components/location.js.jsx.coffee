@TripLocation = React.createClass
  render: ->
    `<tr>
      <td> {this.props.tripLocation.city} </td>
      <td> {this.props.tripLocation.country} </td>
      <td> {Date(Date.parse(this.props.tripLocation.arrival_date_time))} </td>
     </tr>`

 $("h1").click ->
  $.post
    url: "/products/"
    data:
        product:
            name: "Filip"
            description: "whatever"

    dataType: "json"
    success: (data) ->
      alert data.id
