# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
after_at = (text) -> 
  if(text.lastIndexOf("@") > text.lastIndexOf(" ")) 
    return text.substr(text.lastIndexOf("@") + 1)
  else
    false
$ ->
  $("textarea#prayer_title").on('input', -> 
    if (name=after_at(prayer_title.value)) != false
      alert(name)
    )
  $("a#friends_at").on('click', ->
    prayer_title.value = prayer_title.value + "@"
    )
