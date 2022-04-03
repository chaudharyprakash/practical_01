$(document).on('turbolinks:load', function(){
  $(document).ready(function () {
    $('form').parsley();
  })
  
  window.Parsley.addValidator('fileextension', (function (value, requirement) {
    var allowedExtensions, fileExtension;
    fileExtension = value.split('.').pop();
    allowedExtensions = requirement.split(',');
    return $.inArray(fileExtension, allowedExtensions) > -1;
  }), 32).addMessage('en', 'fileextension', 'Please enter a valid file');

  window.Parsley.addValidator('filesize', (function (value, requirement) {
    var input = $('input[type="file"]');
    var maxsize = requirement;
    var max_bytes = maxsize * 1000, file = input[0].files[0];
    return file.size <= max_bytes;
    var allowedExtensions, fileExtension;
  }), 32).addMessage('en', 'filesize', 'Please upload under 1MB file');
    
  $('.sidebar-mini').resize()
  $.each($(".sidebar-dropdown > a"), function(ind, element){
    if($(element).parent().hasClass("active")) {
      $(element).next(".sidebar-submenu").slideDown(200);
      // $(element).parent().removeClass("active");
    }
  });

  $(document).on('click', 'li.menu', function(){
    if(!$(this).hasClass('sidebar-dropdown')){
      $(this).addClass('active');
      $('li').removeClass('active');
    }
  })

  $(".sidebar-dropdown > a").click(function() {
    $(".sidebar-submenu").slideUp(200);
    if($(this).parent().hasClass("active")) {
      $(this).parent().removeClass("active");
      $(".sidebar-dropdown").removeClass("active");
    }
    else{
      $(".sidebar-dropdown").removeClass("active");
      $(this).next(".sidebar-submenu").slideDown(200);
      $(this).parent().addClass("active");
    }
  });
  $('.sidebar-submenu > ul > li .active').closest('.sidebar-dropdown').addClass('active')
  $('.sidebar-submenu > ul > li .active').closest('.sidebar-submenu').slideDown(200);
  $('.sidebar-toggle').click(function(){
    if ($('body').hasClass('sidebar-collapse')){
      $('.user-profile').show()
      // Written Below line for stop scrolling when main side bar opens
      $('body').css('overflow','hidden');
    } else {
      $('.user-profile').hide()
      // Written Below line for enable scrolling when main side bar collapsed
      $('body').css('overflow','auto');
    }
  })
});
