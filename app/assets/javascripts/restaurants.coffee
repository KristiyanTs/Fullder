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

document.addEventListener 'turbolinks:load', ->
  $(window).scroll ->
    url = $('.pagination a[rel=next]').attr('href')
    if url && $(window).scrollTop() > $(document).height() - $(window).height() - 100
      $('.pagination').text("Loading more results...")
      $.getScript(url)
