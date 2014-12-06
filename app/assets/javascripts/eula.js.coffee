#= require eula/eula_helper
#= require eula/eula_styler
#= require eula/eula_window

class @Eula
  constructor: (domain, user_id, id) ->
    @domain = domain
    @user_id = user_id
    @window = new EulaWindow(this)

  load: (callback, scope) ->
    me = this
    if !@loaded
      succ = (data) ->
        me.eulas = {}
        me.user_id = data.uid
        data.terms.map (itm) ->
          me.eulas[itm.code] = itm.text
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
    if !@loaded
      rs = () ->
        @realShow(code, callbacks)
      @load rs, this
    else
      @realShow(code, callbacks)

  hide: () ->
    false

  accept: () ->
    EulaHelper.sendData('/api/accept.json?term=' + @current_code + '&uid=' + @user_id + '&accepted=1')

  decline: () ->
    EulaHelper.sendData('/api/accept.json?term=' + @current_code + '&uid=' + @user_id + '&accepted=0')
