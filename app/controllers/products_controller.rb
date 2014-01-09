class ProductsController < ApplicationController

  def search_results
    @products = product_results
    if @products.count == 0
      flash.now[:info] = "Your search returned 0 results but feel free to browse!"
      @products = Product.all.order("name DESC")
    end
  end

  def index
    if params.has_key? :farm_id
      @products = Product.where "farm_id = #{params[:farm_id]}" 
    else
      @products = Product.all
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

    def product_results
      products_by_desc = Product.where("description LIKE ?", "%#{params[:products][:search]}%") 
      products_by_name = Product.where("name LIKE ?", "%#{params[:products][:search]}%") 
      products_by_name + products_by_desc
    end
end

