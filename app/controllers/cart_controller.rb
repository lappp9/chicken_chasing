class CartController < ApplicationController
	include CartsHelper
	respond_to :json

	def add
		session[:cart_product_ids] ||= []
		session[:cart_product_ids] << params[:product_id]
		render json: { cart_product_ids: session[:cart_product_ids] }
	end

	def show
		render json: session[:cart_product_ids]
	end
	
	def checkout

	end

	def destroy
		session[:cart_product_ids].delete(params[:product_id])
		render json: { status: "sucess" }
	end
end