class Customer::OrdersController < ApplicationController

  before_action :authenticate_customer!
  before_action :correct_cartitem, only: [:edit, :update, :destroy]


    def new
    end

    def create
    end

    def index
    end

    def show
    end

    private

  def correct_cartitem
    @order = Order.find(params[:id])
      if @order.customer != current_customer
        redirect_to root_path
      end
  end

end
