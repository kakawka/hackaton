$(document).ready(function () {
  var eula = new Eula('');

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
