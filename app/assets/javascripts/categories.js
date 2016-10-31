$(document).on('turbolinks:load', function() {
  $('.product-show-more').on('click tap', function() {
    $(this).next('.product-more-options').toggle();
  });
});

