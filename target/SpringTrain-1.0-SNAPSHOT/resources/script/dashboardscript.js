$(document).ready(function(){
  $("tr").click(function(){
    console.log("okkk");
    removeOthersUsers();
    $(this).addClass("active");
     $(this).addClass("btn-info");
     
  })
  function removeOthersUsers(){
    $("tr").removeClass("active");
      $("tr").removeClass("btn-info");
}
    });  

