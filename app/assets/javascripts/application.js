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
//= require foggy
//= require jquery-ui
//= require underscore
//= require gmaps/google
//= require jquery.timepicker.js
//= require moment
//= require bootstrap-datetimepicker
//= require clipboard
//= require jquery.remotipart
//= require jquery.raty
//= require ratyrate
//= require turbolinks
//= require_tree .

document.addEventListener("turbolinks:load", function() {
  $('.restaurant-search-input').tooltip({
    placement: "bottom",
    trigger: "focus"
  });
  $('.time-picker').timepicker();
})