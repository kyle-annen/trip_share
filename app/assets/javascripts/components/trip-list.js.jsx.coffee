Table = ReactBootstrap.Table
Panel = ReactBootstrap.Panel

@TripList = React.createClass
  getInitialState: ->
    tripLocations: @props.data
  getDefaultProps: ->
    triplocations: []
  render: ->
    `<div class="container">
      <h2>Trip Itinerary</h2>
      <Table responsive>
        <thead>
          <tr>
            <th>City</th>
            <th>Country</th>
            <th>Arrival</th>
          </tr>  
        </thead>
        <tbody>
          { this.state.tripLocations.map((tripLocation) => <TripLocation key={tripLocation.id} tripLocation={tripLocation}/> )}
        </tbody>
      </Table>
    </div>`
     
#          { this.state.triplocations.map((triplocation) => <TripLocation key={triplocation.id} record={triplocation}/> )}

#ref = this.state.records;
#for (i = 0, len = ref.length; i < len; i++) {
#  record = ref[i];
#  React.createElement(Record, {
#    key: record.id,
#    record: record
#  });
#}
