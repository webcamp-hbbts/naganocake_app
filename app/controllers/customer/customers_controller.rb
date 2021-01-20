class Customer::CustomersController < ApplicationController
    
    before_action :authenticate_customer!
    
  def show
    @customer = Customer.find(current_customer.id)
  end

  def edit
    @customer = Customer.find(current_customer.id)
  end
  
  def confirm
    # @customer = Customer.find(current_customer.id)
  end

  def update
    customer = Customer.find(current_customer.id)
    customer.update(customer_params)
    redirect_to customer_customers_path(current_customer)
  end
  
  def hide
    customer = current_customer
    customer.update(is_deleted: true)
    reset_session
    flash[:notice] = "ありがとうございました。またのご利用を心よりお待ちしております。"
    redirect_to root_path
  end

  private
  def customer_params
    params.require(:customer).permit(
     :last_name,
     :first_name,
     :last_name_kana,
     :first_name_kana,
     :email,
     :postcode,
     :address,
     :phone_number,
     :is_deleted
     )
  end
    
    private
  
  def correct_cartitem
    @customer = Castomer.find(params[:id])
      if @customer.customer != current_customer
        redirect_to root_path
      end
  end
end
