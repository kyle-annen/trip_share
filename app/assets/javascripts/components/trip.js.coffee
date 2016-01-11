

@Trip = React.createClass
  getInitialState: ->
    trip: @props.data
  getDefaultProps: ->
    trip: []
  render: ->
    React.DOM.div
      className: 'container'
      React.DOM.table
        className: 'table'
      React.DOM.thead null,
        React.DOM.tr null,
          React.DOM.th null, 'Name'
          React.DOM.th null, 'Blurb'
          React.DOM.th null, 'Cost'
      React.DOM.tr null,
        React.DOM.td null, @props.trip.name
        React.DOM.td null, @props.trip.cost
