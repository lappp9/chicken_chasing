class ProductsController < ApplicationController

  def search_results
      @products = Product.where("description LIKE ?", "%#{params[:products][:search]}%") 
      if @products.blank?
        flash.now[:info] = "Your search returned 0 results but feel free to browse!"
        @products = Product.all.order("name DESC")
      end
  end

  def new
    @product = Product.new
    @farm = Farm.find_by( id: current_user.farm_id )
    unless @farm
      flash[:info] = "Please sign in to add a product!"
      redirect_to login_path
    end
  end

  def show 
    @product = Product.find_by id: params[:id]
    unless @product
      flash[:warning] = "That product doesn't exist but you can create it!"
      redirect_to new_product_path
    end
  end
  
  def create 
    @product = Product.new product_params 

    debugger

    if @product.save
      redirect_to product_path(@product)
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
      params.require(:product).permit(:name, :description, :category, :price, :photo_url, :farm_id)
    end
end
