# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
#
#

$(document).ready ->       

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

  submitAllForms -> 
    #kick off posting and keep posting each successive
    #form depending on success or failure of the one it's dependent on

    data = getFarmerData()
    $.ajax({
      type: "POST",
      url: "/farmers",
      data: data,
      success: submitFarmForm(),
      dataType: "application/json"
    });

  #go through the forms and pull out all the data and put it into a json object
  getFarmerData ->

  getFarmData ->

  getProductData ->



