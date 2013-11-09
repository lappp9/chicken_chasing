class FarmersController < ApplicationController
  def new
    @product = Product.new
    @farmer  = Farmer.new
    @farm    = Farm.new
    @user    = User.new
  end

  def create
    #@user = User.find_by (id: params[:user_id])
    @farmer = Farmer.new farmer_params

    if @farmer.save #&& @user
      #@farmer.user = @user
      #sign_in @farmer.user 
      redirect_to @farmer
    else
      render 'new'
    end
  end
end
