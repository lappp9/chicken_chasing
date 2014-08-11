$ ->
	$(".cart-badge").hide() if $(".cart-badge").html() == "0"	
	$(".chat-badge").hide() if $(".chat-badge").html() == "0"

	$(".glyphicon-shopping-cart,.glyphicon-comment").click -> 
		if $(this).css("color") == "rgb(255, 255, 255)"
			$(this).css("color", "rgb(82, 165, 147)")
		else
			$(this).css("color", "rgb(255, 255, 255)")

	$(".remove").tooltip()

	$(".glyphicon-shopping-cart").click ->
		$(".glyphicon-remove").click -> 
			product_id = $(this).attr("data-product-id")
			quantity = $(".product-in-cart[data-product-id="+product_id+"] small").html().split(" ")[1]
			new_total = +$(".cart-badge").html() - quantity

			$(".product-in-cart[data-product-id="+product_id+"]").remove()
			$("hr[data-product-id="+product_id+"]").remove()
			remove_product_id_from_cart(product_id)
			$(".cart-badge").hide()
			$(".cart-badge").html(new_total)
			$(".cart-badge").fadeIn(300)
			$(".cart-btn").html("View Cart ( #{new_total} items )")

	remove_product_id_from_cart = (product_id) ->
		$.ajax(
	      type: "DELETE",
	      url: "/cart/" + product_id,
	    ).done (data) ->
	      console.log data
	      return
