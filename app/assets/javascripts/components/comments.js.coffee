@Comments = React.createClass
  getInitialState: ->
    comments: @props.data
  getDefaultProps: ->
    comments: []
  addComment: (comment) ->
    comments = @state.comments.slice()
    comments.unshift comment
    @setState comments: comments
  render: ->
    React.DOM.div
      className: 'comments-section'
      React.DOM.h3
        className: 'comments-title'
        'Comments'
      React.createElement CommentForm, handleNewComment: @addComment
      for comment in @state.comments
        React.createElement Comment, key: comment.id, comment: comment
      React.DOM.hr null
