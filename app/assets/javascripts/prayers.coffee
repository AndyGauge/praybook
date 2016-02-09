# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
after_at = (text) -> 
  if(text.lastIndexOf("@") > text.lastIndexOf(" ")) 
    return text.substr(text.lastIndexOf("@") + 1)
  else
    false
friend_names = (obj) ->
  JSON.parse(obj.getAttribute("data-friends")).map( (f) ->
    f.name
  )
filter_names = (list, key) ->
  list.filter( (f) ->
    if f.toLowerCase().indexOf(key.toLowerCase()) != -1
      true
    else
      false
  )
append_prayer_for = (id) ->
  n = document.createElement("input")
  n.type = "hidden"
  n.value = id
  n.name = "prayer[for][]"
  new_prayer.appendChild(n)
load_friends = ->
  req = new XMLHttpRequest()
  req.open("GET", "/friends/names.json", true)
  req.addEventListener("load", ->
    prayer_title.setAttribute("data-friends", req.responseText)
    )
  req.send(null)
## OnLoad Event Systems:
$ ->
  $("textarea#prayer_title").on('input', -> 
    if (name=after_at(prayer_title.value)) != false
      if ((names=filter_names(friend_names(prayer_title), name)).length == 1)
        prayer_title.value = prayer_title.value.slice(0, prayer_title.value.lastIndexOf("@")) + names[0] + " "
        JSON.parse(prayer_title.getAttribute("data-friends")).forEach( (obj) ->
          if(obj.name == names[0]) 
            append_prayer_for(obj.id)
        )
        help_friends.style["display"]="none"
    if (prayer_title.value == "")
      while (d = document.getElementsByName("prayer[for][]")[0])
        d.parentElement.removeChild(d)
      help_friends.style["display"]="none"
    )
  $("a#friends_at").on('click', ->
    help_friends.style["display"]="block"
    prayer_title.value = prayer_title.value + "@"
    prayer_title.focus()
    )
  load_friends()
