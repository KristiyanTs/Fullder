//= require jquery
//= require jquery_ujs
//= require jquery.turbolinks
//= require turbolinks
//= require bootstrap-sprockets
//= require bootstrap-select
//= require bootstrap/alert
//= require bootstrap/dropdown
//= require select2-full
//= require cocoon
//= require_tree .

$(document).ready(function() {
  $(".alert").fadeTo(2000, 500).slideUp(500, function(){
      $(".alert").alert('close');
  });
  $('.restaurant-search-input').tooltip({
    placement: "bottom",
    trigger: "focus"
  });
});