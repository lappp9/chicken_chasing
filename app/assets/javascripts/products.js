
var add_product_id_to_cart, increase_cart_total, show_cart_badge;
var products = [];

$(".glyphicon-comment").popover({
  content: "comments",
  template: '<div class="popover comment-popover"><div class="arrow"></div><div class="popover-inner"><h3 class="popover-title"></h3><div class="popover-content"><p></p></div></div></div>'
});

$(".glyphicon-shopping-cart").popover({
  html: true,
  content: function() {
    return $(".cart-content").html();
  },
  template: '<div class="popover cart-popover"><div class="arrow"></div><div class="popover-inner"><h3 class="popover-title"></h3><div class="popover-content"><p></p></div></div></div>'
});

$('.add-to-cart').click(function(e) {
  e.preventDefault();
  $(".cart-badge").hide();
  increase_cart_total();
  return add_product_id_to_cart($(this).attr("data-product-id"));
});

add_product_id_to_cart = function(product_id) {
  return $.ajax({
    type: "POST",
    url: "/cart",
    data: {
      "product_id": product_id
    }
  }).done(function(data) {
    add_product_to_cart_popover(data);
    console.log(data);
  });
};

add_product_to_cart_popover = function(products) {
  $.ajax({
    type: "GET",
    url: "/cart_products",
  }).done(function(data){
    console.log(data);
    var i = 0;
    var total_quantity = 0;

    for(i = 0; i < data.length; i++) {
      total_quantity += data[i].quantity;
    }

    $(".cart-btn").html("View Cart (" + total_quantity + " items)");

    $view_cart_button = $(".cart-btn");

    $(".cart-content .container-fluid").html("");

    for(i = 0; i < data.length; i++){
      console.log(data.image_url);

      cart_product = "<div class = 'product-in-cart row' data-product-id = '"+ data[i].id +"'>";
        cart_product += '<div class = "col-md-2 img-rounded"><img style = "width: 30px;" src = "' + data[i].image_url + '"/></div>';
        cart_product += "<div class = 'col-md-7 product-in-cart-dropdown'><a href='/products/" + data[i].id + "'>" + data[i].name + "</a><br> <small>Quantity: "+ data[i].quantity +"</small></div>";
        cart_product += "<div class = 'col-md-2'>";
        cart_product += "<span class = 'glyphicon glyphicon-remove' data-product-id='"+data[i].id+"'> </span>";
        cart_product += "</div></div>";
        cart_product += "<hr data-product-id = '"+data[i].id+"'>";

      $(".cart-content .container-fluid").append(cart_product);
    }

    $(".cart-content .container-fluid").append($view_cart_button);


/*
    <div class = "product-in-cart row" data-product-id = "<%= p.id %>"> 
      <div class = "col-md-2 img-rounded"><%= image_tag p.image.url(:thumb), style: "width: 30px;" %></div>
      <div class = "col-md-7 product-in-cart-dropdown"><%= link_to p.name, product_path(p) %><br> <small>Quantity: <%= @product_hash[p] %></small></div>
      <div class = "col-md-2">
        <span class="glyphicon glyphicon-remove " data-product-id="<%= p.id %>">
        </span>
      </div>
    </div>
    <hr data-product-id = "<%= p.id %>">
*/
  });
};


show_cart_badge = function() {
  return $(".cart-badge").fadeIn(300);
};

increase_cart_total = function() {
  var cart_total;
  cart_total = +$(".cart-badge").html();
  show_cart_badge();
  return $(".cart-badge").html(cart_total + 1);
};

add_product_to_cart_popover();

$('#quantity').keypress(function(e) {
    var a = [];
    var k = e.which;
    
    for (i = 48; i < 58; i++)
        a.push(i);
    
    if (!(a.indexOf(k)>=0))
        e.preventDefault();
    
});

$("#quantity").change(function(){
  var price = parseFloat($(".product-price").html() * $(this).val());

  $(".total-price").html($(".product-price").html() * $(this).val() );
});

$(".add-to-cart-from-listing").click(function(e){
  e.preventDefault();

  var i = 0;
  var quantity = $("#quantity").val();


  for( i = 0; i < quantity; i++){
    $(".cart-badge").hide();
    increase_cart_total();
    add_product_id_to_cart($(this).attr("data-product-id"));
  }

});


