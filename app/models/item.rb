class Item < ApplicationRecord
    
    has_many :order_items
    has_many :cart_items
    belongs_to :genre
    has_many :customers, through: :cart_items
    has_many :orders, through: :order_items

end
