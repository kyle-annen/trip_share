


@Trip = React.createClass
  getInitialState: ->
    trip: @props.data
  getDefaultProps:->
    trip: []
  render: ->
    `<div>
      <span>
        <h2>{this.props.data.name}</h2>
        <h3>{"$ ".concat(parseFloat(this.props.data.cost).toFixed(2))}</h3>
        <h4>{this.props.data.blurb}</h4> 
      </span>
    </div>`
