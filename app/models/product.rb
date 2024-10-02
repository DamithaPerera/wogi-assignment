class Product < ApplicationRecord
    belongs_to :brand
    validates :price, presence: true
end
