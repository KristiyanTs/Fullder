$(document).ready ->

  removeActiveMeals = ->
    $('.active_meal').next().addClass 'hidden'
    $('.active_meal').next().next().addClass 'hidden'
    $('.active_meal').removeClass 'active_meal'
    return

  removeActiveMealSizes = ->
    $('.meal_size_active').removeClass 'meal_size_active'
    return

  showInactiveMeals = ->
    $('.meal.hidden').removeClass 'hidden'
    return

  hideInactiveMeals = ->
    $('.meal:not(.active_meal)').addClass 'hidden'
    return

  $('.meal_image').click ->
    if $(this).parent().hasClass('active_meal')
      removeActiveMeals()
      showInactiveMeals()
    else
      removeActiveMeals()
      $(this).parent().addClass 'active_meal'
      $(this).parent().next().removeClass 'hidden'
      hideInactiveMeals()
    return
  $('.meal_size').click ->
    if $(this).hasClass('meal_size_active')
      removeActiveMealSizes()
    else
      removeActiveMealSizes()
      $(this).parent().next().removeClass 'hidden'
      $(this).addClass 'meal_size_active'
    return
  $('.meal_supplemental').click ->
    if $(this).hasClass('meal_supplemental_active')
      $(this).removeClass 'meal_supplemental_active'
    else
      $(this).addClass 'meal_supplemental_active'
    return
  return