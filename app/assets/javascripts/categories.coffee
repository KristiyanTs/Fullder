$(document).on 'turbolinks:load', ->
  $('.product-info').click ->
    $(this).parent().next('.more-options').toggle()
    return
  return