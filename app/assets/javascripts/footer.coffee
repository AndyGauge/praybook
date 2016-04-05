footer_ready = ->
  $('input, textarea').on focus: ->
    if $(window).width() < 960
      $('footer').addClass('hidden')
  $('input, textarea').on blur: ->
    $('footer.hidden').removeClass('hidden')
$(document).ready(footer_ready)
$(document).on('page:load', footer_ready)
