# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).ready ->
  
  window.product_form_count = 1

  #
  # ADD LEFT AND RIGHT CONTROLS FOR ARROW BUTTONS
  #
  $(document).keydown (e) ->
    if e.keyCode is 39 and not $('#product-form').hasClass('active')
      $(".carousel-control.right").click()
      false

  $(document).keydown (e) ->
    if e.keyCode is 37 and not $('#farmer-form').hasClass('active')
      $(".carousel-control.left").click()
      false
    
  #
  # MAKE SURE THE LEFT AND RIGHT CONTROLS ONLY SHOW UP AT THE RIGHT TIMES
  #
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

  #
  # ADD AND REMOVE PRODUCT FORMS VIA AJAX
  #
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

  #
  # ADD EXPLANATION ALERT TO FIRST PAGE OF SIGNUP
  #
  showAlert = ->
    $("#myAlert").removeClass "hidden"
    $("#myAlert").addClass "in"

  window.setTimeout (->
    showAlert()
  ), 5000

  # So this is where all the ajax form submission happens in a chaining sort of way.  Should i let someone 
  # submit every form seperately and just use farmers/new etc?
  #

  $('#farmer-signup').click (e) ->
    e.preventDefault();
    #postAllData(getUserFormDataAsJson(), "users")

  #nextModel = (model) ->
    #if(model == "users")
      #return "farmers"
    #if(model == "farmers")
      #return "farms"
    #if(model == "farms")
      #return "products"
    #if(model == "products")
      #return ""

  #nextFormData = (model, id) ->
    #if(model == "users")
      #alert("the user id is " + id)
      #return getFarmerFormDataAsJson(id)
    #if(model == "farmers")
      #return getFarmFormDataAsJson(id)
    #if(model == "farms")
      #return getProductFormDataAsJson(id)
    #if(model == "products")
      #return ""

  #getUserFormDataAsJson = ->
    #formFields = $("input[id^=user_]")
    #{"user": {"name":formFields[0].value,"email":formFields[1].value, "password":formFields[2].value, "password_confirmation":formFields[3].value}, "ajax":true }

  #getFarmerFormDataAsJson = (userId) ->
    #formFields = $("input[id^=farmer_]")
    #{"farmer": {"favorite_quotes":formFields[0].value, "role_models":formFields[1].value, "personal_philosophy":formFields[2].value}, "ajax":true, "user_id":userId }

  #getFarmFormDataAsJson = (farmerId) ->
    #formFields = $("input[id^=farm_]")
    #{"farm": {"name":formFields[0].value,"description":formFields[1].value,"farmer_id":farmerId }, "ajax":true }

  #getProductFormDataAsJson = (farmId) ->
    #formFields = $("input[id^=product_]")
    #{"product": {"name":formFields[0].value, "description":formFields[1].value, "category":formFields[2].value, "farm_id":farmId }, "ajax":true }

  #window.getFormData = (model, parentId) ->
    #formFields = $("input[id^=" + model + "_]")
    #labels     = $("label[for^=" + model + "_]")

    #jsonForm         = {}
    #jsonForm[model]  = {}
    #jsonForm["ajax"] = true
    #i = 0
    #while i < labels.length
      #jsonForm[model][labels[i].innerHTML.toLowerCase()] = formFields[i].value
      #i++
    #alert JSON.stringify jsonForm
    #jsonForm

  #postAllData = (data, model) -> 
    #$.ajax
      #type: "POST",
      #url: "/" + model,
      #data: data 
      #success: (data) ->
        #if(data.id)
          #alert("great " + model + " success..." + "\n now we'll send the " + nextModel(model) + " form")

          #nextFormModel = nextModel(model)
          #if(nextFormModel != "" )
            #alert( "the next form data to be sent is " + JSON.stringify(nextFormData(model, data.id) )
            #postAllData( nextFormData(model, data.id), nextModel(model)) ) 
        #else
          #alert(model + " failure...")
          #alert(" The response was " + JSON.stringify(data) )
    #.done ( msg ) ->
      #alert( "All done with " + model + "part" )



