//= require jquery
//= require jquery.turbolinks
//= require jquery_ujs
//= require bootstrap-sprockets
//= require bootstrap-select
//= require bootstrap/alert
//= require bootstrap/dropdown
//= require jquery.infinite-pages
//= require select2-full
//= require cocoon
//= require slick.min
//= require jquery-ui
//= require underscore
//= require gmaps/google
//= require jquery.timepicker.js
//= require moment
//= require bootstrap-datetimepicker
//= require turbolinks
//= require_tree .

document.addEventListener("turbolinks:load", function() {
  $(".alert").fadeTo(2000, 500).slideUp(500, function(){
      $(".alert").alert('close');
  });
  $('.restaurant-search-input').tooltip({
    placement: "bottom",
    trigger: "focus"
  });
  $('.time-picker').timepicker();
})