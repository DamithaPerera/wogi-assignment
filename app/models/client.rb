class Client < ApplicationRecord
    has_many :product_accesses
    validates :email, uniqueness: true
end
