class Admin::OrdersController < ApplicationController

    before_action :authenticate_admin!
    

  def index
    # ページ遷移元によって変更
    @path = Rails.application.routes.recognize_path(request.referer)
    if @path[:controller] == "customer"
      @orders = Order.page(params[:page]).per(10)
    else
      @orders = Order.page(params[:page]).per(10)
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