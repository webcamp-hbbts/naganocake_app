class Admin::OrderItemsController < ApplicationController

  before_action :authenticate_admin!


  def update
    @order_item = OrderItem.find(params[:id])
    @order_item.update(order_item_params)
    @order = @order_item.order
    if @order.order_items.where(production_status: "製作完了").to_a.count == @order.order_items.to_a.count
      @order.update(status: "発送準備中")
    else @order.order_items.where(production_status: "製作中").to_a.count != 0
      @order.update(status: "製作中")
    end
    redirect_to admin_order_path(@order)
  end

  private
  def order_item_params
    params.require(:order_item).permit(:production_status)
  end
end
