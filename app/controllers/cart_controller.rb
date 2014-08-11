class CartController < ApplicationController

	def add
		session[:cart_product_ids] ||= []
		session[:cart_product_ids] << params[:product_id]
		render json: { cart_product_ids: session[:cart_product_ids] }
	end

	def show

	end
	
	def destroy
		session[:cart_product_ids].delete(params[:product_id])
		render json: { status: "sucess" }
	end
end