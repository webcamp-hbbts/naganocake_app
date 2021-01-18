class Genre < ApplicationRecord
    
    with_options presence: true do
        validates :name
    end
end
