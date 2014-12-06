class @EulaWindow
  constructor: () ->
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
    style = document.createElement('style')
    style.type = 'text/css'
    style.innerHTML = """
      .eula-underlay {
        display: none;
        position: fixed;
        top: 0;
        left: 0;
        width: 100%;
        height: 100%;
        background: #000;
        opacity: 0.8;
      }
      .eula-window {
        display: none;
        position: fixed;
        width: 500px;
        height: auto;
        top: 50%;
        left: 50%;
        margin: 0 0 0 -250px;
        transform: translateY(-50%);
        background: #fff;
      }
      .eula-window_content {
        padding: 30px 20px 70px 20px;
      }
      .eula-window_close {
        text-decoration: none;
        position: absolute;
        top: 5px;
        left: 100%;
        margin-left: -20px;
        color: #bbb;
        font-size: 20px;
        font-weight: bold;
      }
      .eula-window_close:hover {
        color: #000;
      }
      .-eula-visible {
        display: block;
      }
      .eula-window_buttons {
        position: absolute;
        top: 100%;
        left: 0;
        width: 100%;
        margin-top: -50px;
      }
      .eula-window_button {
        display: inline-block;
        height: 30px;
        line-height: 30px;
        width: 39%;
        margin: 0 5%;
        color: #fff;
        border: 1px solid red;
        font-size: 15px;
        text-align: center;
        white-space: nowrap;
        vertical-align: middle;
        cursor: pointer;
        line-height: 1.42857143;
      }
      .eula-window_button.-eula-decline {
        background-color: #d9534f;
        border-color: #d43f3a;
      }
      .eula-window_button.-eula-decline:hover {
        background-color: #c9302c;
        border-color: #ac2925;
      }
      .eula-window_button.-eula-accept {
        background-color: #337ab7;
        border-color: #2e6da4;
      }
      .eula-window_button.-eula-accept:hover {
        background-color: #286090;
        border-color: #204d74;
      }
      .-eula-visible {
        display: block;
      }
    """
    document.getElementsByTagName('head')[0].appendChild(style)

  decline: () ->
    if @current_callbacks.decline
      @current_callbacks.decline.call(@callbacks_scope)

  accept: () ->
    if @current_callbacks.accept
      @current_callbacks.accept.call(@callbacks_scope)

  hide: () ->
    EulaHelper.removeClass(@window, '-eula-visible')
    EulaHelper.removeClass(@underlay, '-eula-visible')
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
