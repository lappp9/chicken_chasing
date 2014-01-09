class SessionsController < ApplicationController
  def new
  end
  
  def create 
    @user = User.find_by email: params[:session][:email]

    if @user && @user.authenticate( params[:session][:password] )
      sign_in @user
      if @user.is_farmer?
        redirect_to @user.farmer
      else
        redirect_to @user
      end
        
    else
      flash.now[:danger] = "Invalid password/email combination"
      render 'new'
    end
  end

  def destroy
    sign_out
    redirect_to root_url
  end
end
