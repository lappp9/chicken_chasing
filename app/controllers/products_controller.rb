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
  
  def create 
    @product = Product.new product_params 

    if @product.save
      render json: @product
    else
      render json: @product.errors
    end
  end

  def destroy
    @product.destroy! if @product = Product.find_by(id: params[:id])
    render json: {}
  end

  private
    def product_params
      params.require(:product).permit(:name, :description, :category, :farm_id)
    end
end
