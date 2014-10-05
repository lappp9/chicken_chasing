class FarmersController < ApplicationController
  #before_action :is_logged_in_farmer?, only: :show

  def new
    @farmer  = Farmer.new
    @user    = @farmer.build_user
  end

  def create

    @farmer = Farmer.new(farmer_params)

    if @farmer.save
      sign_in @farmer.user 
      flash[:success] = "Congratulations your farmer profile was created successfully!"
      session[:farmer_id] = @farmer.id
      debugger

      render new_farm_path
    else
      render 'new'
    end
  end

  def show 
    if signed_in? && current_user.farmer && (current_user.farmer == Farmer.find_by(id: params[:id]))
      @farmer = Farmer.find_by(id: params[:id])
    else
      redirect_to root_path
    end
  end

  def destroy
    @farmer.destroy! if @farmer = Farmer.find_by(id: params[:id])
    render json: {}
  end


  private
    def is_logged_in_farmer? 
      unless signed_in? && (current_user.farmer == Farmer.find_by( id: params[:id]))
        redirect_to root_path
      end
    end

    def farmer_params
      params.require(:farmer).permit!
    end
end
