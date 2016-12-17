var YelpModal = React.createClass({
	render: function() {
		return(
      <div>
        <div id="myModal" className="modal fade" role="dialog">
          <div className="modal-dialog">
            <div className="modal-content">
              <div className="modal-header">
                <div type="button" className="close" data-dismiss="modal">&times;</div>
                <h4 className="navbar-brand text-center">Out and About</h4>
              </div>
              <div className="modal-body">
                <YelpSearch
                handleTyping={this.props.handleTyping} 
                result={this.props.result}
                />
              </div>
              <div className="modal-footer">
                <div type="button" className="btn btn-default" data-dismiss="modal">Close</div>
              </div>
            </div>

          </div>
        </div>
      </div>
	);
	}
});