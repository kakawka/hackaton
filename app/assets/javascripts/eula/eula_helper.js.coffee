class @EulaHelper
  @addClass: (el, className) ->
    if (el.classList)
      el.classList.add(className);
    else
      el.className += ' ' + className;

  @removeClass: (el, className) ->
    if (el.classList)
      el.classList.remove(className);
    else
      el.className = el.className.replace(new RegExp('(^|\\b)' + className.split(' ').join('|') + '(\\b|$)', 'gi'), ' ');

  @find: (el, selector) ->
    el.querySelector(selector)

  @getJSON: (url, success, fail, scope) ->
    request = new XMLHttpRequest()
    request.open('GET', url, true)

    request.onload = () ->
      if (request.status >= 200 && request.status < 400)
        data = JSON.parse(request.responseText)
        if success
          success.call(scope, data)
      else
        if fail
          fail.call(scope)

    request.onerror = () ->
      if fail
        fail.call(scope)

    request.send()
    true

  @sendData: (url) ->
    request = new XMLHttpRequest()
    request.open('POST', url, true)

    # request.onload = () ->
    #   if (request.status >= 200 && request.status < 400)
    #     data = JSON.parse(request.responseText)
    #     if success
    #       success.call(scope, data)
    #   else
    #     if fail
    #       fail.call(scope)

    # request.onerror = () ->
    #   if fail
    #     fail.call(scope)

    request.send()
    true
