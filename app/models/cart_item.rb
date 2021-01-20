class CartItem < ApplicationRecord
    belongs_to :customer
    belongs_to :item


    with_options presence: true do
        validates :amount
    end

    def subtotal
      (self.item.tax_exclude_price * 1.1) * self.amount
    end
end
