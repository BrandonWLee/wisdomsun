// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require_tree .

$(document).ready(function(){
    var path = window.location.pathname.split('/')[1];
  var menu_item;
  switch(path){
    case 'about':
      menu_item = '#menu-about';
      break;
    case 'books':
      menu_item = '#menu-books';
      break;
    case 'events':
      menu_item = '#menu-events';
      break;
    case 'downloads':
      menu_item = '#menu-downloads';
      break;
    case 'bulletin':
      menu_item = '#menu-bulletin';
      break;
    case 'contact':
      menu_item = '#menu-contact';
      break;
    default:
      menu_item = '#menu-home';
  }
  $(menu_item).addClass('active');
});
