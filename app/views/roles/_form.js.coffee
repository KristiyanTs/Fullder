$('.modal-content').html("<%= j(render partial: 'new_role').html_safe%>")

$('.select-permissions').select2 theme: 'bootstrap'
