#= require eula/eula_helper
#= require eula/eula_styler
#= require eula/eula_window

class @Eula
  constructor: (domain, user_id, id) ->
    @domain = domain
    @user_id = user_id
    if @user_id == ''
      @user_id = EulaHelper.getCookie('eula_uid')
    if @user_id == null
      @user_id = ''
    @window = new EulaWindow(this)

  load: (callback, scope) ->
    me = this
    if !@loaded
      succ = (data) ->
        me.eulas = {}
        me.acceptances = {}
        me.user_id = data.uid
        EulaHelper.setCookie('eula_uid', me.user_id)
        data.terms.map (itm) ->
          me.eulas[itm.code] = itm.text
        data.acceptances.map (itm) ->
          me.acceptances[itm.code] = itm.accepted
        me.loaded = true
        callback.call(scope)
      EulaHelper.getJSON('/api/terms.json?domain=' + @domain + '&uid=' + @user_id, succ, null, this)
    else
      callback.call(scope)

  realShow: (code, callbacks) ->
    if @eulas[code]
      @window.show @eulas[code], callbacks, this
    else
      console.log """EULA part with code #{code} not found"""

  show: (code, callbacks) ->
    @current_code = code
    console.log(callbacks)
    if !@loaded
      rs = () ->
        if !@acceptances[code]
          @realShow(code, callbacks)
        else
          if callbacks.accept
            callbacks.accept.call(this)
      @load rs, this
    else
      if !@acceptances[code]
        @realShow(code, callbacks)
      else
        if callbacks.accept
          callbacks.accept.call(this)

  hide: () ->
    false

  accept: () ->
    EulaHelper.sendData('/api/accept.json?term=' + @current_code + '&uid=' + @user_id + '&accepted=1')

  decline: () ->
    EulaHelper.sendData('/api/accept.json?term=' + @current_code + '&uid=' + @user_id + '&accepted=0')
