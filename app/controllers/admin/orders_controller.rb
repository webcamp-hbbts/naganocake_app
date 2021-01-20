class Admin::OrdersController < ApplicationController

  def index
    # ページ遷移元によって変更
    @path = Rails.application.routes.recognize_path(request.referer)
    if @path[:controller] == "customer"
      @orders = Order.where(current.user_id)
     else
      @orders = Order.all
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