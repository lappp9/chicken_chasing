class StaticPagesController < ApplicationController
  def home
    redirect_to current_user.farmer if signed_in? && current_user.is_farmer?
  end

  def about
  end

  def tour
  end

  def premium
  end

end
