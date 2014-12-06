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
    request.send()
    true

  @setCookie: (name, value) ->
    days = 10
    date = new Date()
    date.setTime(date.getTime()+(days*24*60*60*1000))
    expires = "; expires="+date.toGMTString()
    document.cookie = name+"="+value+expires+"; path=/";

  @getCookie: (name) ->
    cookie = " " + document.cookie
    search = " " + name + "="
    setStr = null
    offset = 0
    end = 0
    if cookie.length > 0
      offset = cookie.indexOf(search)
      if offset != -1
        offset += search.length
        end = cookie.indexOf(";", offset)
        if end == -1
          end = cookie.length
        setStr = unescape(cookie.substring(offset, end))
    setStr
