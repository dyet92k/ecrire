ObserveJS.bind 'Popup', class
  loaded: =>
    if btn = @element().querySelector('.close')
      @on 'click', btn, @remove
    @when 'click', @clicked
    @when 'keyup', @escaped
    @on 'dialog:close', @remove

  clicked: (e) =>
    el = e.target
    while el != @element() && el?
      el = el.parentElement

    unless el?
      @remove()

  escaped: (e) =>
    if e.keyCode == 27
      @remove()

  remove: (e) =>
    @element().remove()
