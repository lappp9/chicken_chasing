class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  
  # add this back after done testing api
  #  protect_from_forgery with: :exception
  
  include SessionsHelper

  before_action :gather_cart_products

  private
	  def gather_cart_products
	  	@cart_products = session[:cart_product_ids].map { |id| @product = Product.find_by id: id } if session[:cart_product_ids]
	  end
end
