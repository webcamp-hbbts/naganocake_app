class Admin::OrdersController < ApplicationController

    before_action :authenticate_admin!


  def index
    case params[:order_sort]
     when "0"
      @orders = Order.page(params[:page]).per(10)
     when "1"
      @customer = Customer.find(params[:key])
      @orders = @customer.orders.page(params[:page]).per(10)
    end
  end

  def show
    @order = Order.find(params[:id])
    @order_items = OrderItem.where(order_id: @order)
  end

  def update
    @order = Order.find(params[:id])
    @order.update(order_params)
    redirect_to order_path(@order)
  end

  private
  def order_params
    params.require(:order).permit(:status)
  end
end