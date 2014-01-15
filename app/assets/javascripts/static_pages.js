
$("#header").hover(function(){ 
  $(".shadow").css("opacity", "0");    
});


$(".left-shadow").hover(function(){ 
  $(".right-shadow").css("opacity",".5");
  $(".right-shadow").removeClass("hidden");

  $(".left-shadow").addClass("hidden");
});


$(".right-shadow").hover(function(){ 
  $(".left-shadow").css("opacity",".5");
  $(".left-shadow").removeClass("hidden");

  $(".right-shadow").addClass("hidden");
});

