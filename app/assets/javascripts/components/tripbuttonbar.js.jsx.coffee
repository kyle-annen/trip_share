#Bootstrap Imports
Button = ReactBootstrap.Button
ButtonToolbar = ReactBootstrap.ButtonToolbar
Glyphicon = ReactBootstrap.Glyphicon
Modal = ReactBootstrap.Modal
Popover = ReactBootstrap.Popover
Tooltip = ReactBootstrap.Tooltip
Input = ReactBootstrap.Input
ButtonInput = React.Bootstrap.ButtonInput


#@TripButtonBar = React.createClass
# render:->
#    `<ButtonToolbar>
#      LocationButton
#      <Button bsStyle="primary" ><Glyphicon glyph="plane" /> Add Travel</Button>
#      <Button bsStyle="primary" ><Glyphicon glyph="bed" sunglasses/> Add Lodging</Button>
#      <Button bsStyle="primary" ><Glyphicon glyph="apple" /> Add Food</Button>
#      <Button bsStyle="primary" ><Glyphicon glyph="sunglasses" /> Add Activity</Button>
#    </ButtonToolbar>`

#LocationButton = React.createClass
@TripButtonBar = React.createClass
  getInitialState: ->
    showModal: false
  close: ->
    @setState showModal: false
  open: ->
    @setState showModal: true
  render: ->
    `<div>
      <Button bsStyle="primary" onClick={this.open}><Glyphicon glyph="globe" /> Add Location</Button>

      <Modal show={this.state.showModal} onHide={this.close}>
        <Modal.Header closeButton>
          <Modal.Title><Glyphicon glyph="globe" /> Select a Location</Modal.Title>
        </Modal.Header>
        <Modal.Body> 
          <form>
            <Input
        </Modal.Body>
        <Modal.Footer>
          <Button onClick={this.close}>Add</Button>
        </Modal.Footer>
      </Modal>

    </div>`
        


        




