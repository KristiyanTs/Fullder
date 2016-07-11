$('.modal-content').html("<%= j(render partial: 'new_position').html_safe%>")

$('.select-permissions').select2 theme: 'bootstrap'
