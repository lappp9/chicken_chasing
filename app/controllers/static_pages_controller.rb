class StaticPagesController < ApplicationController
  def home
    if signed_in? 
      redirect_to current_user
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
