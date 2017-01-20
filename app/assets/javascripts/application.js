//= require jquery
//= require jquery.turbolinks
//= require jquery_ujs
//= require bootstrap-sprockets
//= require bootstrap-select
//= require bootstrap/alert
//= require bootstrap/dropdown
//= require select2-full
//= require cocoon
//= require slick.min
//= require foggy
//= require jquery-ui
//= require underscore
//= require gmaps/google
//= require moment
//= require clipboard
//= require ahoy
//= require jquery.remotipart
//= require turbolinks
//= require_tree .

document.addEventListener("turbolinks:load", function() {
  $('.restaurant-search-input').tooltip({
    placement: "bottom",
    trigger: "focus"
  });
  
  // Hide Header on on scroll down
  var didScroll;
  var lastScrollTop = 0;
  var delta = 5;
  var navbarHeight = $('#mainNav').outerHeight();

  $(window).scroll(function(event){
      didScroll = true;
  });

  setInterval(function() {
      if (didScroll) {
          hasScrolled();
          didScroll = false;
      }
  }, 250);

  function hasScrolled() {
      var st = $(this).scrollTop();
      
      // Make sure they scroll more than delta
      if(Math.abs(lastScrollTop - st) <= delta)
          return;
      
      // If they scrolled down and are past the navbar, add class .nav-up.
      // This is necessary so you never see what is "behind" the navbar.
      if (st > lastScrollTop && st > navbarHeight){
          // Scroll Down
          $('#mainNav').removeClass('nav-down').addClass('nav-up');
      } else {
          // Scroll Up
          if(st + $(window).height() < $(document).height()) {
              $('#mainNav').removeClass('nav-up').addClass('nav-down');
          }
      }
      
      lastScrollTop = st;
  }

})