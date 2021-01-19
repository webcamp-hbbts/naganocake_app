class Customer::AddressesController < ApplicationController
    
    def index
        @addresses = Address.all
        @address = Address.new(address_params)
        @address.save #createアクション
        # redirect_back(fallback_location: )
    end
    
    def edit
        @address = Address.find(params[:customer.id])
    end
    
    def update
        @address = Address.find(params[:id])
        @address.update
        redirect_to customer_address_path
    end
    
    def destroy
        @address = Address.find(params[:id])
        @address.delete
        # redirect_back(fallback_location: )
    end
    
    private
    
    def address_params
        params.permit(:name, :address, :postcode)
    end
end
