$('.modal-content').html("<%= j(render partial: 'position_form').html_safe%>")

$('.select-permissions').select2 theme: 'bootstrap'
