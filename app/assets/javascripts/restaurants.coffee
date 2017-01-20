document.addEventListener 'turbolinks:load', ->
  $('.btn-submit').click ->
    $('html, body').animate { scrollTop: $('.index-restaurants').offset().top }, 500
    return
  $(window).scroll ->
    url = $('.infinite-pagination a[rel=next]').attr('href')
    if url && $(window).scrollTop() > $(document).height() - $(window).height() - 200
      $('.pagination').text("Loading more results...")
      $.getScript(url)
  $('#restaurant-image-gallery').slick
    autoplay: true
    arrows: false
    variableWidth: true
    autoplaySpeed: 2000
    infinite: true
    centerMode: true
    centerPadding: '60px'
  return