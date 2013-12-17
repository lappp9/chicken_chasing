class UsersController < ApplicationController
  def show 
    @user = User.find_by id: params[:id]
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new user_params

    if params[:ajax] && @user.save
      sign_in @user 
      render json: @user
    elsif params[:ajax] && @user.errors
      render json: @user.errors
    elsif @user.save 
      sign_in @user
      flash[:success] = "Congratulations! You've signed up for Chicken Chasing!"
      redirect_to @user
    else
      render 'new' 
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
