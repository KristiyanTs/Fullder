ready = ->
  removeActiveMealSizes = ->
    $('.meal_size_active').removeClass 'meal_size_active'
    return

  $('.meal_size').click ->
    if $(this).hasClass('meal_size_active')
      removeActiveMealSizes()
    else
      removeActiveMealSizes()
      $(this).addClass 'meal_size_active'
    return

  $('.meal_supplemental').click ->
    if $(this).hasClass('meal_supplemental_active')
      $(this).removeClass 'meal_supplemental_active'
    else
      $(this).addClass 'meal_supplemental_active'
    return
  return


$(document).ready ready
$(document).on 'page:load', ready