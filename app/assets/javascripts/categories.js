$(document).on('turbolinks:load', function() {
  $(".product-info").click(function() {
    $(this).parent().next(".more-options").toggle();
  });  
});