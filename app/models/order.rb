class Order < ApplicationRecord
    
    enum payment_method: {
       クレジットカード: 0,
       銀行振り込み: 1,
    } 
    
    enum status: {
        入金待ち: 0,
        入金確認中: 1,
        制作中: 2,
        発送準備中: 3,
        発送済: 4,
    }
    
    belongs_to :customer
    has_many :order_items
    has_many :items, through: :order_items
end
