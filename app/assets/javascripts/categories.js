$(document).on('turbolinks:load', function() {
  $('.product-show-more').on('click tap', function() {
    if ($(this).html() == "show more") {
      $(this).html("show less");
    }
    else {
      $(this).html("show more");
    }
    $(this).next('.product-more-options').toggle();
  });
});

