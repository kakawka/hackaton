$(document).ready(function () {
  // var eula = new Eula('');
  var eula = new Eula('', {"window_bg":"#ffffff","window_font_size":"14px","buttons_font_size":"14px","close_button_color":"#ff6600","close_button_color_hover":"#008000","accept_button_color":"#337ab7","accept_button_color_hover":"#2e6da4","decline_button_color":"#d9534f","decline_button_color_hover":"#c9302c","window_text_color":"#000000","accept_button_text_color":"#ffffff","decline_button_text_color":"#ffffff"});

  eula.show('STARTING', {
    accept: function () {
      console.log('now continue');
    },
    decline: function () {
      alert('You declined the EULA and not will be redirected to index page');
      location.href = '/';
    },
    hide: function () {
      alert('You declined the EULA and not will be redirected to index page');
      location.href = '/';
    }
  });

  $('.js-show-instructions').click(function (ev) {
    var me = this;

    eula.show('INSTRUCTIONS', {
      accept: function () {
        ufoStart();
        $(me).next().removeClass('hidden');
      }
    });
  });

  eula.isAccepted('INSTRUCTIONS', function () {
    ufoStart();
  });
});
