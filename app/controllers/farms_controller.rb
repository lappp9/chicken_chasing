class FarmsController < ApplicationController
  def index
    @farms = Farm.all
  end
  
  def show
    @farm = Farm.find_by id: params[:id]

    @products = @farm.products if @farm

    if farm_doesnt_exist_and_user_is_logged_in?
      if current_user.is_farmer?
        flash[:danger] = "That farm doesn't exist but you can create it!"
        redirect_to new_farm_path
      else
        redirect_to root_path
      end
    elsif @farm.nil?
      flash[:danger] = "You must be signed in to create a farm!"
      redirect_to login_path
    end

  end

  def new 
    @farm = Farm.new
    if !current_user.nil? && current_user.farmer.farm
      flash[:danger] = "Your farm has already been created."
      redirect_to farmer_path(current_user.farmer)
    elsif current_user.nil?
      flash[:danger] = "You have to sign up to create a farm!"
      redirect_to new_farmer_path
    end
  end

  def create
    @farm = Farm.new farm_params

    if @farm.save
      session[:farm_id] = @farm.id
      flash[:success] = "Farm successfully created!"
      redirect_to new_product_path
    else
      flash.now[:danger] = "Something went wrong with your submission!"
      render 'new'
    end
  end

  def destroy
    @farm.destroy! if @farm = Farm.find_by(id: params[:id])
    render json: {}
  end

  private 
    def farm_params
      params.require(:farm).permit(:name, :description, :farmer_id, :image)
    end

    def farm_doesnt_exist_and_user_is_logged_in?
      @farm.nil? && current_user
    end
end
