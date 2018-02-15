$(document).ready(function () {
    //$("#infobtn").effect("bounce", { times:2, distance:10 }, 200);
    $("#infobtn").click(function() {
    $('html,body').animate({
        scrollTop: $(".layer").offset().top},
        1000);
});
});