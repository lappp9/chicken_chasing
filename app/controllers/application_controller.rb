class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  
  # add this back after done testing api
#  protect_from_forgery with: :exception
  include SessionsHelper
end
