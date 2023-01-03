class OrdersController < ApplicationController
  before_action :set_order, only: %i[show]

  def index
    @orders = Order.all
  end

  def show
    @order
  end

  def create
    @order = Order.create(order_params)
    @order.update(user: current_user, cart: current_cart)

    @order.save

    cookies.delete(:cart_id)

    redirect_to root_path
  end

  def new
    @order = Order.new
  end

  private

  def set_order
    @order = Order.find_by(id: params[:id])
  end

  def order_params
    params.require(:order).permit(:name, :email, :address, :payment)
  end
end
