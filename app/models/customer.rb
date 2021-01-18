class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
         has_many :addresses
         has_many :orders
         has_many :cart_items
         has_many :items, through: :cart_items
         
    with_options presence: true do
        validates :last_name
        validates :first_name
        validates :last_name_kana
        validates :first_name_kana
        validates :postcode
        validates :address
        validates :phone_number
    end
    
    validates :is_deleted, inclusion: {in: [true, false]}

end
