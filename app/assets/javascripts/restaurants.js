document.addEventListener("turbolinks:load", function() {
  $('#restaurant-image-gallery').slick({
    autoplay: true,
    variableWidth: true,
    autoplaySpeed: 2000,
    infinite: true,
    centerMode: true,
    centerPadding: '60px'
  });
})