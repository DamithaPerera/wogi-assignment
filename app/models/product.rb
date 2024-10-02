class Product < ApplicationRecord
    belongs_to :brand
    validates :price, presence: true
    validates :customizable_fields, length: { maximum: 5 }
end
