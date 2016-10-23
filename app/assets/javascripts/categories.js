$(document).on('turbolinks:load', function() {
  $('.product-info').on('click tap', function() {
    $(this).parent().next('.more-options').toggle();
  });
});