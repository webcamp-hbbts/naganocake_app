class Item < ApplicationRecord
    
    has_many :order_items
    has_many :cart_items
    belongs_to :genre
    has_many :customers, through: :cart_items
    has_many :orders, through: :order_items


    with_options presence: true do
        validates :name
        validates :description
        validates :tax_exclude_price
        validates :image
    end
    
    validates :is_active, inclusion: {in: [true, false]}
    
    attachment :image

end
