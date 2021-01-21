class Address < ApplicationRecord
    
    belongs_to :customer
    
    with_options presence: true do
        validates :name
        validates :address
        validates :postcode
    end

    def customer_address
      self.postcode + self.address + self.name
    end
    

end


