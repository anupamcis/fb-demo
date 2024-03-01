class Restaurant < ApplicationRecord
    validates :name, presence: true
    validates :description, presence: true
    validates :restaurant_type, presence: true

end
