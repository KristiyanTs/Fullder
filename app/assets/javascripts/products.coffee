document.addEventListener 'turbolinks:load', ->
  $('input[type=checkbox]').on 'change', (evt) ->
    max = parseInt($(this).parent().parent().attr('class').split(' ').pop())
    if $(this).parent().parent().siblings().children().children(':checked').length + 1 > max
      @checked = false
      $(this).parent().parent().parent().parent().children('.max-options').effect 'highlight', { color: '#CF000F' }, 'slow'
    return
  return