$(document).ready(function () {
  var eula = new Eula('localhost', null);
  eula.show('test', {
    accept: function () {
      alert('accepted!');
    },
    decline: function () {
      alert('declined!');
    },
    hide: function () {
      alert('just close the window');
    }
  });
});
