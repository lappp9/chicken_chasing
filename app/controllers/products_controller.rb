class ProductsController < ApplicationController
  def index
    @products = Product.where("description LIKE ?", "%#{params[:products][:search]}%")
    @products ||= Product.all.order("name DESC")
  end
end
