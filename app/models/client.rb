class Client < ApplicationRecord
    has_many :product_accesses
    validates :email, uniqueness: true
    validates :payout_rate, numericality: { greater_than_or_equal_to: 0 }, allow_nil: true
end
