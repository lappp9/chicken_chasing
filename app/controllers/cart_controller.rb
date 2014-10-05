class CartController < ApplicationController
	include CartsHelper
	respond_to :json

	def add
		session[:cart_product_ids] ||= []
		session[:cart_product_ids] << params[:product_id]

		cart_products
		#render json: { cart_product_ids: session[:cart_product_ids] }
		render json: @products, status: :ok
	end

	def checkout

	end

	def show
		cart_products
		respond_to do |format|
			format.json { render json: @products, status: :ok }
			format.html { }
		end
	end

	def index
		cart_products
		render json: @products, status: :ok
	end
	
	def destroy
		session[:cart_product_ids].delete(params[:product_id])
		render json: { status: "sucess" }
	end

	private 

	def cart_products
		@products = []
		cart_product_ids = session[:cart_product_ids] || []
		cart_product_ids.each do |cart_product_id|
			@products << Product.find(cart_product_id) 
		end if cart_product_ids.any?
			
		product_counts = {}
		@products.group_by(&:id).each { |k,v| product_counts[k] = v.count }

		cart_products = []
		@products.each do |product|
			cart_products << { 
				id: product.id, 
				name: product.name, 
				price: product.price, 
				description: product.description, 
				image_url: product.image.url(:thumb),
				quantity: product_counts[product.id]
			}
		end

		@products = cart_products.uniq
	end


end
