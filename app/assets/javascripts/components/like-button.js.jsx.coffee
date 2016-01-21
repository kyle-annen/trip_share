

LikeButton = React.createClass
  getInitialState: ->
    liked: false
  handleClick: (event) ->
    @setState {liked: !@.state.liked}
  render: ->
    text = @stat.liked ? 'like' : 'havent liked'
    `<p onClick={this.handleClick}>
      You {text} this. Click to toggle.
    </p>`
    

    

