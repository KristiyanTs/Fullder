document.addEventListener 'turbolinks:load', ->
  $('#main_icon').click (e) ->
    e.preventDefault()
    $('#wrapper').toggleClass 'active'
    return
  return