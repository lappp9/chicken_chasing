class FormsController < ApplicationController
  def product_form
    @product = Product.new
    render file: '/shared/_product_form', layout: false
  end
end
