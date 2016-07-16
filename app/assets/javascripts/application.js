//= require jquery
//= require best_in_place
//= require jquery_ujs
//= require jquery.turbolinks
//= require best_in_place.jquery-ui
//= require turbolinks
//= require bootstrap-sprockets
//= require bootstrap-select
//= require bootstrap/alert
//= require bootstrap/dropdown
//= require select2-full
//= require cocoon
//= require_tree .

$(document).ready(function() {
  /* Activating Best In Place */
  jQuery(".best_in_place").best_in_place();
  $('.refresh_prices').bind("ajax:success", function(event, new_price, status, xhr){
    currency = $(".button-right a").text().charAt(0);
    new_price = parseFloat(new_price.replace(/"/g,"")).toFixed(2);
    $(".button-right a").html(currency + new_price);
    $(".cart-subtotal").html("Subtotal:" + currency + new_price);


  });
});