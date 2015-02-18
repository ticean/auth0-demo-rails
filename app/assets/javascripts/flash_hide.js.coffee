# Hide Rails flash message.
$ ->
  timeoutInterval = 3000
  flashCallback = -> $(".alert").hide()
  $(".alert").bind 'click', (ev) => $(".alert").hide()
  setTimeout(flashCallback, timeoutInterval)
