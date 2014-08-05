
$(".glyphicon-comment").popover({
	content: "comments"
})

$(".glyphicon-shopping-cart").popover({
	html: true, 
	content: -> 
		$(".cart-content").html()
})

$('.add-to-cart').click (e) ->
	e.preventDefault()
	$(".cart-badge").hide()
	increase_cart_total()
	add_product_id_to_cart($(this).attr("data-product-id"))

show_cart_badge = -> 
	$(".cart-badge").fadeIn(300)

increase_cart_total = ->
	cart_total = +$(".cart-badge").html()
	show_cart_badge()
	$(".cart-badge").html(cart_total + 1)

add_product_id_to_cart = (product_id) ->
	$.ajax(
      type: "POST",
      url: "/cart",
      data: { "product_id" : product_id }
    ).done (data) ->
      console.log data
      return