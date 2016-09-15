document.addEventListener 'turbolinks:load', ->
  $('#main_icon').click (e) ->
    e.preventDefault()
    $('#wrapper').toggleClass 'active'
    return
  return

document.addEventListener 'turbolinks:load', ->
  do ->

    toggleHandler = (toggle) ->
      toggle.addEventListener 'click', (e) ->
        e.preventDefault()
        if @classList.contains('is-active') == true then @classList.remove('is-active') else @classList.add('is-active')
        return
      return

    'use strict'
    toggles = document.querySelectorAll('.c-hamburger')
    i = toggles.length - 1
    while i >= 0
      toggle = toggles[i]
      toggleHandler toggle
      i--
    return
  return