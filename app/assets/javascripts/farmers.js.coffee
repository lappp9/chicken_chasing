# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).ready ->       

  window.product_form_count = 1

  $(document).keydown (e) ->
    if e.keyCode is 39 and not $('#product-form').hasClass('active')
      $(".carousel-control.right").click()
      false

  $(document).keydown (e) ->
    if e.keyCode is 37 and not $('#farmer-form').hasClass('active')
      $(".carousel-control.left").click()
      false

    
  $(".next").each ->
    $(this).click (e) ->
      e.preventDefault()
      $(".carousel-control.right").click()

  $(".prev").each ->
    $(this).click (e) ->
      e.preventDefault()
      $(".carousel-control.left").click()


  $('.carousel-control.left').click -> 
    if($('#farm-form').hasClass('active'))
      $('.carousel-control.left').addClass('hidden')

  $('.carousel-control.right').click ->
    if( $('#farmer-form').hasClass('active')) 
      $('.carousel-control.left').removeClass('hidden')

  $('.carousel-control.right').click -> 
    if($('#farm-form').hasClass('active')) 
      $('.carousel-control.right').addClass('hidden')

  $('.carousel-control.left').click -> 
    if($('#product-form').hasClass('active')) 
      $('.carousel-control.right').removeClass('hidden')

  $('#add-product-button').click (e) ->
    e.preventDefault()

    $.ajax
      method: "get"
      url: "/product_form"
      success: (data) ->
        $("#product-list").append data
        $('#remove-product-button').removeClass("hidden")
        window.product_form_count++

  $('#remove-product-button').click (e) ->
    e.preventDefault();
    $('#product-list').children().last().remove()
    window.product_form_count--
    if(window.product_form_count == 1)
      $('#remove-product-button').addClass('hidden')


  #submitAllForms -> 
    ##kick off posting and keep posting each successive
    ##form depending on success or failure of the one it's dependent on

    #data = getFarmerData()
    #$.ajax({
      #type: "POST",
      #url: "/farmers",
      #data: data,
      #success: submitFarmForm(),
      #dataType: "application/json"
    #});

  ##go through the forms and pull out all the data and put it into a json object
  #getFarmerData ->

  #getFarmData ->

  #getProductData ->



