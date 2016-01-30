#Bootstrap Imports
Button = ReactBootstrap.Button
ButtonToolbar = ReactBootstrap.ButtonToolbar
Glyphicon = ReactBootstrap.Glyphicon
Modal = ReactBootstrap.Modal
Popover = ReactBootstrap.Popover
Tooltip = ReactBootstrap.Tooltip
Input = ReactBootstrap.Input
ButtonInput = ReactBootstrap.ButtonInput

#@TripButtonBar = React.createClass
#  getInitialState: ->
#    showModal: false
#  close: ->
#    @setState showModal: false
#  open: ->
#    @setState showModal: true
#  render: ->
#    React.DOM.div null,
#      React.DOM.Button null,
#        bsStyle: 'primary'
#        onClick: {this.open}
#        React.DOM.Glyphicon null,
#          glyph: 'globe'
#        'Add a Stop'

          





#    `<div>
#      <Button bsStyle="primary" onClick={this.open}><Glyphicon glyph="globe" /> Add Location</Button>
#      <Modal show={this.state.showModal} onHide={this.close}>
#        <Modal.Header closeButton>
#          <Modal.Title><Glyphicon glyph="globe" /> Select a Location</Modal.Title>
#        </Modal.Header>
#        <Modal.Body> 
#          <form>
#            <Input type="text" label="Search By Zipcode" placeholder="Zipcode" buttonAfter={
#               <ButtonInput type="submit" value="Search Location" bsStyle="primary" />} />
#          </form>
#          </Modal.Body>
#          <Modal.Footer>
#            <Button onClick={this.close}>Add</Button>
#          </Modal.Footer>
#        </Modal>
#      </div>`
