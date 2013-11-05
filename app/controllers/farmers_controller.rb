class FarmersController < ApplicationController
  def new
    @product = Product.new
    @farmer  = Farmer.new
    @farm    = Farm.new
  end
end
