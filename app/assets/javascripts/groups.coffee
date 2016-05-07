# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
groupReady = ->
  $('.group-modal').on('show.bs.modal', (event) ->
    groupId = $(event.relatedTarget).data('group')
    modal = $(this)
    if typeof groupId != "undefined"
      $.ajax
        url: "/groups/#{groupId}/edit",
        success: (response) ->
          modal.find('.modal-body').empty().append(response)
    )
$(document).on('page:load', groupReady)
$ ->
  groupReady()
