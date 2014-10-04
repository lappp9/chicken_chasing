$(function() {

  var remove_product_id_from_cart;
  if ($(".cart-badge").html() === "0") {
    $(".cart-badge").hide();
  }
  if ($(".chat-badge").html() === "0") {
    $(".chat-badge").hide();
  }

  $(".glyphicon-shopping-cart,.glyphicon-comment").click(function() {
    if ($(this).css("color") === "rgb(255, 255, 255)") {
      return $(this).css("color", "rgb(82, 165, 147)");
    } else {
      return $(this).css("color", "rgb(255, 255, 255)");
    }
  });

  $(".remove").tooltip();

  $(".glyphicon-shopping-cart").click(function() {
    return $(".glyphicon-remove").click(function() {
      var new_total, product_id, quantity;
      product_id = $(this).attr("data-product-id");
      quantity = $(".product-in-cart[data-product-id=" + product_id + "] small").html().split(" ")[1];
      new_total = +$(".cart-badge").html() - quantity;
      $(".product-in-cart[data-product-id=" + product_id + "]").remove();
      $("hr[data-product-id=" + product_id + "]").remove();
      remove_product_id_from_cart(product_id);
      $(".cart-badge").hide();
      $(".cart-badge").html(new_total);
      $(".cart-badge").fadeIn(300);
      return $(".cart-btn").html("View Cart ( " + new_total + " items )");
    });
  });

  return remove_product_id_from_cart = function(product_id) {
    return $.ajax({
      type: "DELETE",
      url: "/cart/" + product_id
    }).done(function(data) {
      console.log(data);
    });
  };
});

