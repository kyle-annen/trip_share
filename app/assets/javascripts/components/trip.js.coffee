

@Trip = React.createClass
  getInitialState: ->
    trip: @props.data
  getDefaultProps: ->
    trip: []
  render: ->
    React.DOM.div
      className: 'pull-left'
      React.DOM.span null,
        React.DOM.h2 null,
          @props.data.name
        React.DOM.h3 null,
          "$ ".concat(parseFloat(@props.data.cost).toFixed(2))
        React.DOM.h3 null,
          @props.data.blurb
