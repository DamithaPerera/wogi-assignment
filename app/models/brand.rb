class Brand < ApplicationRecord
    has_many :products, dependent: :destroy
    validates :name, presence: true
    validates :customizable_fields, length: { maximum: 5 }
    validates :state, inclusion: { in: %w(active inactive), message: "%{value} is not a valid state" }, allow_nil: true
end
