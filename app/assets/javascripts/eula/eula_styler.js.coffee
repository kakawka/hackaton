class @EulaStyler
  constructor: (params) ->
    @styles =
      window_bg: '#fff'
      window_font_size: '14px'
      buttons_font_size: '14px'
      close_button_color: '#bbb'
      close_button_color_hover: '#000'
      accept_button_color: '#337ab7'
      accept_button_color_hover: '#286090'
      decline_button_color: '#d9534f'
      decline_button_color_hover: '#c9302c'
    @applyCss()

  setStyles: (newStyles) ->
    @styles = newStyles
    @applyCss()

  applyCss: () ->
    old_style = document.getElementById('eula_css')
    if old_style
      old_style.parentNode.removeChild(old_style)
    style = document.createElement('style')
    style.type = 'text/css'
    style.id = "eula_css"
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
        background: #{@styles.window_bg};
      }
      .eula-window_content {
        padding: 30px 20px 20px 20px;
        font-size: #{@styles.window_font_size};
      }
      .eula-window_close {
        text-decoration: none;
        position: absolute;
        top: 5px;
        left: 100%;
        margin-left: -20px;
        color: #{@styles.close_button_color};
        font-size: 20px;
        font-weight: bold;
      }
      .eula-window_close:hover {
        text-decoration: none;
        color: #{@styles.close_button_color_hover};
      }
      .-eula-visible {
        display: block;
      }
      .eula-window_buttons {
        padding-bottom: 20px;
      }
      .eula-window_button {
        display: inline-block;
        padding: 10px 0;
        width: 39%;
        margin: 0 5%;
        color: #fff;
        border: 1px solid red;
        font-size: #{@styles.buttons_font_size};
        text-align: center;
        white-space: nowrap;
        vertical-align: middle;
        cursor: pointer;
        line-height: 1.42857143;
      }
      .eula-window_button.-eula-decline {
        background-color: #{@styles.decline_button_color};
        border-color: #d43f3a;
      }
      .eula-window_button.-eula-decline:hover {
        background-color: #{@styles.decline_button_color_hover};
        border-color: #ac2925;
      }
      .eula-window_button.-eula-accept {
        background-color: #{@styles.accept_button_color};
        border-color: #2e6da4;
      }
      .eula-window_button.-eula-accept:hover {
        background-color: #{@styles.accept_button_color_hover};
        border-color: #204d74;
      }
      .-eula-visible {
        display: block;
      }
    """
    document.getElementsByTagName('head')[0].appendChild(style)
