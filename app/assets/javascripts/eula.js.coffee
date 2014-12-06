#= require eula/eula_helper
#= require eula/eula_window

class @Eula
  constructor: (domain, user_id) ->
    @domain = domain
    @user_id = user_id
    @window = new EulaWindow()

  load: (callback, scope) ->
    @eulas =
      'demo': 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Maxime amet nulla error delectus suscipit modi libero harum natus, vero odit earum culpa ab excepturi saepe repudiandae vitae! Dolorum, accusamus, ipsa.',
      'test': '2 Lorem ipsum dolor sit amet, consectetur adipisicing elit. Quas nemo aut quis quia, cumque, nisi blanditiis expedita reiciendis ducimus odit ipsum et, quibusdam. Praesentium, numquam laudantium minus nobis consectetur iusto.'
    @loaded = true
    callback.call(scope)

  realShow: (code, callbacks) ->
    if @eulas[code]
      @window.show @eulas[code], callbacks, this
    else
      console.log """EULA part with code #{code} not found"""

  show: (code, callbacks) ->
    if !@loaded
      rs = () ->
        @realShow(code, callbacks)
      @load rs, this
    else
      @realShow(code)
