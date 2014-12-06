// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require medium-editor
//= require bootstrap-sprockets
//= require cocoon
//= require bootstrap
//= require tinycolor-0.9.15.min
//= require pick-a-color
//= require customizer

$(document).ready(function () {
  new Customizer();
  var editor = new MediumEditor('.editable');
  $('.js-terms-list').on('cocoon:after-insert', function(e, insertedItem) {
    new MediumEditor(insertedItem.find('.js-agreement-text'), {
      diffLeft: 25,
      diffTop: 10,
      firstHeader: 'h1',
      secondHeader: 'h2',
      delay: 1000,
      staticToolbar: true,
      stickyToolbar: true
    });
    console.log(insertedItem);
  });
});
