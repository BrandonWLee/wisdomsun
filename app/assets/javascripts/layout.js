$(document).ready(function(){
  var patharr = window.location.pathname.split('/');
  var path = patharr[1];
  var otherpage = patharr.length >= 3 ? patharr[2] : null;
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
    case 'albums':
    case 'photos':
      menu_item = '#menu-photos';
      break;
    case 'otherPages':
    case 'categories':
    case 'downloads':
      menu_item = '#menu-downloads';
      break;
    case 'bulletin':
      menu_item = '#menu-bulletin';
      break;
    case 'support':
      menu_item = '#menu-support';
      break;
    case 'contact':
      menu_item = '#menu-contact';
      break;
    default:
      menu_item = '#menu-home';
  }
  if(path === 'categories'){
    switch(otherpage){
      case '3':
        menu_item = '#menu-downloads';
        break;
      default:
        menu_item = '#menu-category';
    }
  }else if(path === 'otherPages'){
    switch(otherpage){
      case '1':
      case '2':
      case '3':
      case '4':
        menu_item = '#menu-about';
        break;
      case '7':
      case '8':
      case '9':
        menu_item = '#menu-downloads';
        break;
      default:
        menu_item = '#menu-category'; 
    }
  }
  $(menu_item).addClass('active');

  /* Dropdowns */
  $('#cat-about').hover(function(){
    $(this).find('.menu-dropdown').show();
  }, function(){
    $(this).find('.menu-dropdown').hide();
  });
  $('#cat').hover(function(){
    $(this).find('.menu-dropdown').show();
  }, function(){
    $(this).find('.menu-dropdown').hide();
  });
  $('.menu-dropdown').click(function(e){
    e.stopPropagation();
  });
});
