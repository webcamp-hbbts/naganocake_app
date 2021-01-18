class OrderItem < ApplicationRecord
    
    enum production_status: {
        着手不可: 0,
        制作待ち: 1,
        制作中: 2,
        制作完了: 3
    }
    
    belongs_to :item
    belongs_to :order
    
    with_options presence: true do
        validates :item_id
        validates :order_id
        validates :amount
        validates :tax_included_price
    end
    
    validates :production_status, inclusion: {in: [0, 1, 2, 3]}

end
