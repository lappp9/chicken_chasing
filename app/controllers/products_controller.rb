class ProductsController < ApplicationController
  def index
    unless params[:products].nil? 
      @products = Product.where("description LIKE ?", "%#{params[:products][:search]}%") 
      @products ||= Product.all.order("name DESC")
    else
      @products = Farm.find_by( id: params[:farm_id] ).products
    end
  end

  def new
    @product = Product.new
  end

  def show 
    @product = Product.find_by id: params[:id]
  end
end
