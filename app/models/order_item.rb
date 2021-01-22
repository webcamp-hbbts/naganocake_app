class OrderItem < ApplicationRecord

    enum production_status: {
        着手不可: 0,
        製作待ち: 1,
        製作中: 2,
        製作完了: 3
    }

    belongs_to :item
    belongs_to :order

    with_options presence: true do
        validates :item_id
        validates :order_id
        validates :amount
        validates :tax_included_price
        validates :production_status
    end

    def subtotal
      (self.tax_included_price * 1.1 * self.amount).to_i
    end

end
