ready = ->

  $('.meal_size').click ->
    html_id = $(this).attr('id')
    meal_size_id = html_id.split('_')[2]
    $("#order_meal_size_id").val(meal_size_id);
    return

  $('.supplemental').click ->
    html_id = $(this).attr('id')
    supplemental_id = ", " + html_id.split('_')[1]
    current_supplementals = $("#order_supplementals_ids").val()
    $("#order_supplementals_ids").val(current_supplementals + supplemental_id);
    return




$(document).ready ready
$(document).on 'page:load', ready