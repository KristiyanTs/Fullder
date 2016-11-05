document.addEventListener 'turbolinks:load', ->
  $('#restaurant-image-gallery').slick
    autoplay: true
    arrows: false
    variableWidth: true
    autoplaySpeed: 2000
    infinite: true
    centerMode: true
    centerPadding: '60px'
  return