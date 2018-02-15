$(document).ready(function(){
   	//Check to see if the window is top if not then display button
     $(document).scroll(function(){
    if ($(this).scrollTop() > 2330) {
      $(".scrollToTop").stop(true, true).fadeIn();
    } else {
      $(".scrollToTop").stop(true, true).fadeOut();
    }
  });
  $('.scrollToTop').click(function(){
      var page = $("html, body");
   page.on("scroll mousedown wheel DOMMouseScroll mousewheel keyup touchmove", function(){
       page.stop();
   });

    page.animate({scrollTop : 0},800),   function(){
       page.off("scroll mousedown wheel DOMMouseScroll mousewheel keyup touchmove");
   };

    return false;
  });
    $("#testbutn").hover(function(){
     $(this).css("background-color", "#263238 ");
      $(this).effect("bounce", { times: 2, distance:10 }, 400);
  }, 		
     function () {
    $(this).css("background-color", "#929fba");
               }
            );
    
    
  initMap();
function initMap() {
        var myLatLng = {lat: 37.980657, lng: 23.732497};

        var map = new google.maps.Map(document.getElementById('googleMap'), {
          zoom: 15,
          center: myLatLng
        });

        var marker = new google.maps.Marker({
          position: myLatLng,
          map: map,
          title: 'Hello World!'
        });
      }  
    

    });