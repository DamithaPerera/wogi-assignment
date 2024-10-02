class Brand < ApplicationRecord
    has_many :products, dependent: :destroy
    validates :name, presence: true
    validates :customizable_fields, length: { maximum: 5 }
end
