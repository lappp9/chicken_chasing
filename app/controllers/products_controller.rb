class ProductsController < ApplicationController
  def index
    @products = Product.where("description LIKE ?", "%#{params[:products][:search]}%")
  end
end
