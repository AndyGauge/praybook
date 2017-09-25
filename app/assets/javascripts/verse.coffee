recommend_verse = ->
  prayer_selector = 'div#prayers div.panel-body'
  prayer_count = $(prayer_selector).length
  if prayer_count > 0
    query_verse = $(prayer_selector).eq(Math.floor(Math.random() * prayer_count)).text()
    $.post
      url: "http://prayer-lex.herokuapp.com/"
      data: query_verse
      success: (data, ts, xhr) ->
        $('div.scripture').append("<p>#{data}</p>")
$ ->
  recommend_verse()
