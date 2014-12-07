#= require eula/eula_styler

class @Customizer
  constructor: () ->
    @styler = new EulaStyler()

    $(".pick-a-color").pickAColor()

    me = this

    $('.js-customize-input').change () ->
      me.styler.setStyles me.getStyleObject()
      true

    $('.js-customize-input').keyup () ->
      me.styler.setStyles me.getStyleObject()
      true

    $('.js-get-code').click (ev) ->
      ev.preventDefault()
      $('.js-code-content').find('code').html( "var eula = new Eula(user_id, \n" +  JSON.stringify(me.getStyleObject()).replace('{', "  {\n    ").replace(/\,/g, ",\n    ").replace('}', "\n  }") + "\n);")
      $('.js-code-content').removeClass('hidden')
      hljs.highlightBlock($('.js-code-content code')[0]);

  getStyleObject: () ->
    result =
      window_bg: '#' + $('.js-window-bg').val()
      window_font_size: $('.js-window-font-size').val()
      buttons_font_size: $('.js-buttons-font-size').val()
      close_button_color: '#' + $('.js-close-button-color').val()
      close_button_color_hover: '#' + $('.js-close-button-color-hover').val()
      accept_button_color: '#' + $('.js-accept-button-color').val()
      accept_button_color_hover: '#' + $('.js-accept-button-color-hover').val()
      decline_button_color: '#' + $('.js-decline-button-color').val()
      decline_button_color_hover: '#' + $('.js-decline-button-color-hover').val()
      window_text_color: '#' + $('.js-window-text-color').val()
      accept_button_text_color: '#' + $('.js-accept-text-color').val()
      decline_button_text_color: '#' + $('.js-decline-text-color').val()
