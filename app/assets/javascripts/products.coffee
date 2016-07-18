$(document).ready ->
  $('.popup_link').click (e) ->
    e.preventDefault()
    $('#popup').html $('<img>').attr('src', @href)
    return
  return