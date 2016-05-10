ObserveJS.bind 'Post.Tags.List', class
  loaded: =>
    @on 'mouseover', @clear
    @when 'keydown', @navigate

  navigate: (e) =>
    switch e.keyCode
      when 40 then @down()
      when 38 then @up()

  down: =>
    el = @element().querySelector('li:focus')
    if el?
      (el.nextElementSibling || el).focus()
    else
      @element().firstElementChild.focus()

  up: =>
    el = @element().querySelector('li:focus')
    if el?
      (el.previousElementSibling || @element().previousElementSibling.querySelector('#TagName')).focus()

  clear: =>
    el = document.activeElement
    if el.getAttribute('as') == 'Post.Tags.Tag'
      el.blur()

