@TripSummary = React.createClass
  getInitialState: ->
    trip: @props.data
  getDefaultProps:->
    trip: []
  render: ->
    `<div className="">
        <h2 className="trip-summary">{this.props.data.name}</h2>
        <h3 className="trip-summary">{"$ ".concat(parseFloat(this.props.data.cost).toFixed(2))}</h3>
        <h4 className="trip-summary">{this.props.data.blurb}</h4> 
    </div>`