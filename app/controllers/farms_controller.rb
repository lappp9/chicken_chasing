class FarmsController < ApplicationController
  def index
    @farms = Farm.all
  end
  
  def show
    @farm = Farm.find_by id: params[:id]
  end

  def create
  end

end
