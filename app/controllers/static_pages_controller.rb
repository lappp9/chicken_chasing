class StaticPagesController < ApplicationController
  def home
    redirect_to current_user.farmer if signed_in? && current_user.is_farmer?
  end

  def about
  end

  def privacy
  end

  def terms
  end

  def tour
  end

  def premium
  end

  def contact
  end
  
  def landing
    render layout: false 
    #render layout: 'landing' 
  end

  def email_list
    # take the email and send them an update when the site is done
    # maybe sign them up too
    debugger
  end

end
