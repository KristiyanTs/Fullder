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
    url = $('.infinite-pagination a[rel=next]').attr('href')
    if url && $(window).scrollTop() > $(document).height() - $(window).height() - 200
      $('.pagination').text("Loading more results...")
      $.getScript(url)


$(document).on 'turbolinks:load', ->
  $('#show-more').on 'click tap', ->
    if $(this).children().html() == 'show more info'
      $(this).html '<h4 class=\'text-center\' style=\'color: grey\'>show less info</h4>'
    else
      $(this).html '<h4 class=\'text-center\' style=\'color: grey\'>show more info</h4>'
    $(this).next('#more-info').toggle()
    return
  return