@Comment = React.createClass
  render: ->
    React.DOM.div
      className: 'single_comment'
      React.DOM.div
        className: 'comment_author'
        @props.comment.author
      React.DOM.div
        className: 'comment_content'
        @props.comment.content
      React.DOM.div
        className: 'comment_date'
        @props.comment.created_at
