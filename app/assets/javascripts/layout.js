$(document).ready(function(){
    var path = window.location.pathname.split('/')[1];
  var menu_item;
  switch(path){
    case 'about':
    case 'aroundtheweb':
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
