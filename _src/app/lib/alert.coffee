ralert = ( type = 'info', msg = 'hello world', timeout = 3000 ) ->

  # verify jquery exists  
  $ = jQuery
  console.error 'jquery is required for ralert module' if not $

  alertr = $(
    "<div class=̣pop-alert-#{ type }>
      <i></i>
      <div class=msg>#{ msg }</div>
    </div>"
  )

  $( 'body' ).append alertr

  setTimeout ->
    alertr.hide( 200, ->
      alertr.remove()
    )
  , timeout

if typeof window isnt 'undefined'
  window.ralert = ralert
else
  console.log 'ralert is a fontend module!'