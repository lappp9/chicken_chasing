class FarmersController < ApplicationController
  def new
    @product = Product.new
    @farmer  = Farmer.new
    @farm    = Farm.new
    @user    = User.new
  end

  def create
    @user = User.find_by(id: params[:user_id])
    @farmer = Farmer.new(farmer_params)
    @farmer.user = @user

    if @farmer.save && @user
      sign_in @farmer.user 
      render json: @farmer 
    else
      render json: @farmer.errors
    end
  end

  def destroy
    @farmer.destroy! if @farmer = Farmer.find_by(id: params[:id])
    render json: {}
  end


  private
    def farmer_params
      params.require(:farmer).permit(:favorite_quotes, :role_models, :personal_philosophy)
    end
end
