$(document).on('turbolinks:load', function() {
  $('.product-show-more').on('click tap', function() {
    if ($(this).html() == "<i class=\"fa fa-angle-down fa-2x\"></i>") {
      $(this).html("<i class='fa fa-angle-up fa-2x'></i>");
    }
    else {
      $(this).html("<i class=\"fa fa-angle-down fa-2x\"></i>");
    }
    $(this).next('.product-more-options').toggle('fast');
  });
});

