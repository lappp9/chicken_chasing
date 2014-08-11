
$(".glyphicon-comment").popover({
	content: "comments",
	template: '<div class="popover comment-popover"><div class="arrow"></div><div class="popover-inner"><h3 class="popover-title"></h3><div class="popover-content"><p></p></div></div></div>'

})

$(".glyphicon-shopping-cart").popover({
	html: true, 
	content: -> 
		$(".cart-content").html()
	template: '<div class="popover cart-popover"><div class="arrow"></div><div class="popover-inner"><h3 class="popover-title"></h3><div class="popover-content"><p></p></div></div></div>'

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