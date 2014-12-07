class @EulaWindow
  constructor: (eulaObject, styles) ->
    @eulaObject = eulaObject
    @underlay = document.createElement('div')
    @window = document.createElement('div')
    @window.innerHTML = """
      <a href="#" class="eula-window_close">&times;</a>
      <div class="eula-window_content">
      </div>
      <div class="eula-window_buttons">
        <button class="eula-window_button -eula-accept">Accept</button>
        <button class="eula-window_button -eula-decline">Decline</button>
      </div>
    """
    EulaHelper.addClass(@underlay, 'eula-underlay')
    EulaHelper.addClass(@window, 'eula-window')
    document.body.appendChild(@underlay)
    document.body.appendChild(@window)
    @styler = new EulaStyler(styles)

  decline: () ->
    EulaHelper.removeClass(@window, '-eula-visible')
    EulaHelper.removeClass(@underlay, '-eula-visible')
    @eulaObject.decline()
    if @current_callbacks.decline
      @current_callbacks.decline.call(@callbacks_scope)

  accept: () ->
    EulaHelper.removeClass(@window, '-eula-visible')
    EulaHelper.removeClass(@underlay, '-eula-visible')
    @eulaObject.accept()
    if @current_callbacks.accept
      @current_callbacks.accept.call(@callbacks_scope)

  hide: () ->
    EulaHelper.removeClass(@window, '-eula-visible')
    EulaHelper.removeClass(@underlay, '-eula-visible')
    @eulaObject.hide()
    if @current_callbacks.hide
      @current_callbacks.hide.call(@callbacks_scope)

  show: (content, callbacks, callbacks_scope) ->
    @current_callbacks = callbacks
    @callbacks_scope = callbacks_scope || this
    EulaHelper.find(@window, '.eula-window_content').innerHTML = content
    EulaHelper.addClass(@window, '-eula-visible')
    EulaHelper.addClass(@underlay, '-eula-visible')
    me = this
    EulaHelper.find(@window, '.eula-window_close').onclick = () ->
      me.hide()
    EulaHelper.find(@window, '.eula-window_button.-eula-decline').onclick = () ->
      me.decline()
    EulaHelper.find(@window, '.eula-window_button.-eula-accept').onclick = () ->
      me.accept()
    true
