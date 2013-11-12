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

  postData = (bucket, data) -> 
    $.ajax
      type: "POST",
      url: "/#{bucket}",
      data: data 
      success: (data) ->
        alert data
    .done ( msg ) ->
      alert( "Response " + JSON.stringify(msg) )


  $('#farmer-signup').click (e) ->
    e.preventDefault()
    userId = postData("users", getUserFormDataAsJson())
    #farmerId = postData("farmers", getFarmerFormDataAsJson())
    #farmId = postData("farms", getFarmFormDataAsJson())
    #postData("products", getProductFormDataAsJson())

  getUserFormDataAsJson = ->
    formFields = $("input[id^=user_]")
    data = {"user": {"name":formFields[0].value,"email":formFields[1].value, "password":formFields[1].value, "password_confirmation":formFields[1].value}, "ajax":true}
    alert(data)
    data

  #getFarmerFormDataAsJson = (userId) ->
    #formFields = $("input[id^=farmer_]")
    #data = {"farmer": {"favorite_quotes":formFields[0].value, "role_models":formFields[1].value, "personal_philosophy":formFields[2].value},  "ajax":true,"user_id":userId}
    #alert(data)
    #data

  #getFarmFormDataAsJson = (farmerId) ->
    #formFields = $("input[id^=farm_]")
    #data = {"farm": {"name":formFields[0].value,"description":formFields[1].value,"farmer_id":farmerId }, "ajax":true }
    #alert(data)
    #data

  #getProductFormDataAsJson = (farmId) ->
    #formFields = $("input[id^=product_]")
    #data = {"product": {"name":formFields[0].value, "description":formFields[1].value, "category":formFields[2].value, "farm_id":farmId}, "ajaxjax":true }
    #alert(data)
    #data

    

  #submitAllForms = -> 

  #so if one of these fails should i call a rollback function that sends delete requests for each one?
  
  ##go through the forms and pull out all the data and put it into a json object
  #getFarmerData ->

  #getFarmData ->

  #getProductData ->



