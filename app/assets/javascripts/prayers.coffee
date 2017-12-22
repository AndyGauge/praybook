# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
## OnLoad Event Systems:
prayerPageReady = ->
  $('.prayer-modal').on('show.bs.modal', (event) ->
    forId = $(event.relatedTarget).data('for')
    prayerId = $(event.relatedTarget).data('prayer')
    modal = $(this)
    if typeof forId != "undefined"
      $.ajax
        url: "/friends/#{forId}/pray",
        success: (response) ->
          person = response['person']
          html = response['html']
          modal.find('.modal-title').text("Prayer For #{person}")
          modal.find('.modal-body').empty().append(html)
          prayerPageReady
    if typeof prayerId != "undefined"
      $.ajax
        url: "/prayers/#{prayerId}/edit",
        success: (response) ->
          modal.find('.modal-title').text("Edit Prayer")
          modal.find('.modal-body').empty().append(response)
          prayerPageReady )
$(document).on("page:load", prayerPageReady)
$ ->
  prayerPageReady()
