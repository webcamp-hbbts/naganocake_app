class Customer::OrdersController < ApplicationController

  before_action :authenticate_customer!
  before_action :correct_cartitem, only: [:edit, :update, :destroy]

    def info
      @addresses = current_customer.addresses
      @address = Address.new
    end

    def create
      @order = Order.new(oreder_params)
    end

    def index
      @orders = current_customer.orders
    end

    def confirm
      @payment_method = params[:payment_method]
      @address = params[:address]
      @addresses = params[:addresses]
    end

    def show
      @order = Order.find(params[:id])
      @order_items = OrderItem.all
    end

    private

  def oreder_params
    params.require(:order).permit(:shipping_price, :billing, :name, :address, :postcode, :payment_method, :status)
  end

  def correct_cartitem
    @order = Order.find(params[:id])
      if @order.customer != current_customer
        redirect_to root_path
      end
  end

end
