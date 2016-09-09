document.addEventListener 'turbolinks:load', ->
  $('#menu-toggle').click (e) ->
    e.preventDefault()
    $('#wrapper').toggleClass 'active'
    return
  return