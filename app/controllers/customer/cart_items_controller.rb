class Customer::CartItemsController < ApplicationController

  before_action :authenticate_customer! 
  before_action :correct_cartitem, only: [:edit, :update, :destroy]

  private
  
  def correct_cartitem
    @cart_item = CartItem.find(params[:id])
      if @cart_item.customer != current_customer
        redirect_to root_path
      end
  end

end
