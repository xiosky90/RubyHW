class CartsController < ApplicationController
  def show
    @products = current_cart.line_items.map { |item| { product: item.product, quantity: item.quantity } }
    @line_items = current_cart.line_items

    respond_to do |format|
      format.html
      format.json { render json: { products: @products } }
    end
  end
end
