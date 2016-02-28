@CommentForm = React.createClass
  getInitialState: ->
    author: ''
    content: ''

  valid: ->
    @state.author && @state.content

  handleChange: (e) ->
    name = e.target.name
    @setState "#{ name }": e.target.value

  handleSubmit: (e) ->
    e.preventDefault()
    $.post '', { comment: @state }, (data) =>
      @props.handleNewComment data
      @setState @getInitialState()
    , 'JSON'

  render: ->
    React.DOM.form
      className: 'form-inline'
      onSubmit: @handleSubmit
      React.DOM.div
        className: 'form-group'
        React.DOM.input
          type: 'text'
          className: 'form-control'
          placeholder: 'Author'
          name: 'author'
          value: @state.author
          onChange: @handleChange
        React.DOM.textarea
          rows: 5
          className: 'form-control'
          placeholder: 'Comment'
          name: 'content'
          value: @state.content
          onChange: @handleChange
        React.DOM.button
          type: 'submit'
          className: 'btn btn-primary'
          disabled: !@valid()
          'Post Comment'
