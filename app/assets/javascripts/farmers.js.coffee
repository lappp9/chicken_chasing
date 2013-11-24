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

  # Thus begins callback hell, I fell like it should be just one function but i just wanted to get it
  # working first so we'll see how refactoring goes.
  # So if one of these fails should i call a rollback function that sends delete requests for each one?
  # Write that function to call delete with the ids that have been collected

  $('#farmer-signup').click (e) ->
    e.preventDefault();
    postUserData(getUserFormDataAsJson())
  
  postUserData = (data) -> 
    $.ajax
      type: "POST",
      url: "/users",
      data: data 
      success: (data) ->
        if(data.id)
          alert("great user success...")
          alert("The farmer data is " + JSON.stringify(getFarmFormDataAsJson()) )
          postFarmerData( getFarmerFormDataAsJson(data.id) )
        else
          alert("user failure...")
    .done ( msg ) ->
      alert( "All done with user part" )

  postFarmerData = (data) -> 
    $.ajax
      type: "POST",
      url: "/farmers",
      data: data 
      success: (data) ->
        alert("Farmer response "+JSON.stringify(data))
        if(data.id)
          alert("great farmer success...")
          postFarmData( getFarmFormDataAsJson(data.id) )
        else
          alert("great farmer failure...")
    .done ( msg ) ->
      alert( "done with farmer part" )

  postFarmData = (data) -> 
    $.ajax
      type: "POST",
      url: "/farms",
      data: data 
      success: (data) ->
        alert("Farm response "+JSON.stringify(data))
        if(data.id)
          alert("great farm success...")
          alert(JSON.stringify(getProductFormDataAsJson(data.id)))
          postProductData( getProductFormDataAsJson(data.id) )
        else
          alert("great farm failure...")
    .done ( msg ) ->
      alert( "done with farm part" )

  postProductData = (data) -> 
    $.ajax
      type: "POST",
      url: "/products",
      data: data 
      success: (data) ->
        alert("Product response "+JSON.stringify(data))
        if(data.id)
          alert("great product success...")
          alert("You submitted everything! Redirect somewhere else or something!")
        else
          alert("great product failure...")
    .done ( msg ) ->
      alert( "done with product part" )

  getUserFormDataAsJson = ->
    formFields = $("input[id^=user_]")
    {"user": {"name":formFields[0].value,"email":formFields[1].value, "password":formFields[2].value, "password_confirmation":formFields[3].value}, "ajax":true }

  getFarmerFormDataAsJson = (userId) ->
    formFields = $("input[id^=farmer_]")
    {"farmer": {"favorite_quotes":formFields[0].value, "role_models":formFields[1].value, "personal_philosophy":formFields[2].value}, "ajax":true, "user_id":userId }

  getFarmFormDataAsJson = (farmerId) ->
    formFields = $("input[id^=farm_]")
    {"farm": {"name":formFields[0].value,"description":formFields[1].value,"farmer_id":farmerId }, "ajax":true }

  getProductFormDataAsJson = (farmId) ->
    formFields = $("input[id^=product_]")
    {"product": {"name":formFields[0].value, "description":formFields[1].value, "category":formFields[2].value, "farm_id":farmId }, "ajax":true }

  showAlert = ->
    $("#myAlert").removeClass "hidden"
    $("#myAlert").addClass "in"

  window.setTimeout (->
    showAlert()
  ), 5000





