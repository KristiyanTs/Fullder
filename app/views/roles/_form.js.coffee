$('.modal-content').html("<%= j(render partial: 'role_form').html_safe%>")

$('.select-permissions').select2 theme: 'bootstrap'
