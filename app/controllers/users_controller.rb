class UsersController < ApplicationController
  def show 
    @user = User.find_by id: params[:id]
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new user_params
    debugger

    if @user.save
      sign_in @user 
      render json: @user
    else @user.errors
      render json: @user.errors
    end
  end

  def destroy
    @user.destroy! if @user = User.find_by(id: params[:id])
    render json: {}
  end
  
  private 
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
end
