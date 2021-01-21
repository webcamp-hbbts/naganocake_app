class Customer::OrdersController < ApplicationController

  before_action :authenticate_customer!
  before_action :correct_cartitem, only: [:edit, :update, :destroy]

    def info
      @address = Address.new
      @customer = current_customer
    end

    def create
      @order = Order.new(order_params)
      @order.customer_id = current_customer.id
      if @order.save
        @cart_items = current_customer.cart_items.all
        @cart_items.each do |cart_item|
          @order_items = @order.order_items.new
          @order_items.item_id = cart_item.item.id
          @order_items.tax_included_price = cart_item.item.tax_exclude_price
          @order_items.amount = cart_item.amount
          @order_items.save
        end
        current_customer.cart_items.destroy_all
        redirect_to homes_thanks_path
      else
        redirect_to "/"
      end
    end

    def index
      @orders = current_customer.orders
    end

    def confirm
      @order = Order.new
      @cart_items = current_customer.cart_items
      @order.payment_method = params[:payment_method]
      if params[:address_option] == "0"
        @order.postcode = current_customer.postcode
        @order.address = current_customer.address
        @order.name = current_customer.last_name
      elsif params[:address_option] == "1"
        @sta = params[:kaito_address].to_i
        @address = Address.find(@sta)
        @order.postcode = @address.postcode
        @order.address = @address.address
        @order.name = @address.name
      elsif params[:address_option] == "2"
        @order.postcode = params[:postcode]
        @order.address = params[:address]
        @order.name = params[:name]
      end
    end

    def show
      @order = Order.find(params[:id])
      @order_items = OrderItem.all
    end

    private

  def order_params
    params.require(:order).permit(:shipping_price, :billing, :name, :address, :postcode, :payment_method, :status)
  end

  def correct_cartitem
    @order = Order.find(params[:id])
      if @order.customer != current_customer
        redirect_to root_path
      end
  end

end
