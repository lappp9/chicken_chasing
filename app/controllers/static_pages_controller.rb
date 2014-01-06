class StaticPagesController < ApplicationController
  def home
    if signed_in?
      if current_user.is_farmer?
        redirect_to current_user.farmer
      else
        redirect_to current_user
      end
    end
  end

  def about
  end

  def tour
  end

  def premium
  end

  def signup_options
  end

end
