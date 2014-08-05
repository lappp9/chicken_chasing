$ ->
	$(".cart-badge").hide() if $(".cart-badge").html() == "0"	
	$(".chat-badge").hide() if $(".chat-badge").html() == "0"

	$(".glyphicon-shopping-cart,.glyphicon-comment").click -> 
		if $(this).css("color") == "rgb(255, 255, 255)"
			$(this).css("color", "rgb(82, 165, 147)")
		else
			$(this).css("color", "rgb(255, 255, 255)")