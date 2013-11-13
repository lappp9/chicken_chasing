class FarmsController < ApplicationController
  def index
    @farms = Farm.all
  end
  
  def show
    @farm = Farm.find_by id: params[:id]
  end

  def create
    @farm = Farm.new farm_params

    if @farm.save
      render json: @farm
    else
      render json: @farm.errors
    end
  end

  def destroy
    @farm.destroy! if @farm = Farm.find_by(id: params[:id])
    render json: {}
  end

  private 
    def farm_params
      params.require(:farm).permit(:farmer_id, :name, :description, :farmer_id)
    end
end
