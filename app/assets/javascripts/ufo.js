var ufoReady = function () {
  window.requestAnimFrame = (function(){
    return  window.requestAnimationFrame       ||
            window.webkitRequestAnimationFrame ||
            window.mozRequestAnimationFrame    ||
            window.oRequestAnimationFrame      ||
            window.msRequestAnimationFrame     ||
            function(/* function */ callback, /* DOMElement */ element){
              window.setTimeout(callback, 1000 / 60);
            };
  })();

  var
    maxX = $(window).width() - $('.js-ufo').width(),
    maxY = $(window).height() - $('.js-ufo').height(),
    x = 0,
    y = 0,
    deltaX = Math.random() * 30,
    deltaY = Math.random() * 30,
    ufoDiv = $('.js-ufo'),
    ufoFly = function () {
      x += deltaX;
      y += deltaY;
      if (x + deltaX > maxX) {
        deltaX = - Math.random() * 30;
      }
      if (x + deltaX < 0) {
        deltaX = Math.random() * 30;
      }
      if (y + deltaY > maxY) {
        deltaY = - Math.random() * 30;
      }
      if (y + deltaY <= 0) {
        deltaY = Math.random() * 30;
      }
      ufoDiv.css({
        top: y,
        left: x
      });
    };

  window.ufoStart = function () {
    ufoDiv.removeClass('hidden');
    console.log('ufoStarted');
      (function animloop(){
        ufoFly();
        requestAnimFrame(animloop);
      })();
  };
};

$(document).ready(ufoReady);
$(document).on('page:load', ufoReady);
