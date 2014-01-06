class FarmsController < ApplicationController
  def index
    @farms = Farm.all
  end
  
  def show
    @farm = Farm.find_by id: params[:id]
    @products = @farm.products

    unless @farm
      if current_user.is_farmer?
        flash[:warning] = "That farm doesn't exist but you can create it!"
        redirect_to new_farm_path
      else
        redirect_to root_path
      end
    end

  end

  def new 
    @farm = Farm.new
    if current_user.farmer.farm
      flash.now[:danger] = "Creating a new farm will overrite your current farm!"
    end
  end

  def create
    @farm = Farm.new farm_params

    if @farm.save
      session[:farm_id] = @farm.id
      flash[:success] = "Farm successfully created!"
      redirect_to new_product_path
    else
      flash[:danger] = "Something went wrong with your submission!"
      render 'new'
    end
  end

  def destroy
    @farm.destroy! if @farm = Farm.find_by(id: params[:id])
    render json: {}
  end

  private 
    def farm_params
      params.require(:farm).permit(:name, :description, :farmer_id)
    end
end
