class Customer::AddressesController < ApplicationController


    def index
      @addresses = Address.all
      @address = Address.new
    end

    def create
      @address = Address.new(address_params)
      @address.customer_id = current_customer.id
      if @address.save
        redirect_back(fallback_location: customer_addresses_path)
      else
        @addresses = Address.all
        render :index
      end
    end

    def edit
        @address = Address.find(params[:id])
    end

    def update
        @address = Address.find(params[:id])
      if @address.update(address_params)
          redirect_to customer_addresses_path
      else
          render :edit
      end
    end

    def destroy
        @address = Address.find(params[:id])
        if @address.delete
          redirect_back(fallback_location: customer_address_path(address))
        else
          render :index
        end
    end

    private

    def address_params
        params.require(:address).permit(:name, :address, :postcode)
    end
end
