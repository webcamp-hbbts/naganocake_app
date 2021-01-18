class CartItem < ApplicationRecord
    belongs_to :customer
    belongs_to :item
    
    
    with_options presence: true do
        validates :amount
    end
end
