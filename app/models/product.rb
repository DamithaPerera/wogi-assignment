class Product < ApplicationRecord
  has_many :cards, dependent: :destroy

  validates :name, presence: true
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :currency, presence: true
  validates :state, inclusion: { in: %w(active inactive), message: "%{value} is not a valid state" }, allow_nil: true
  validates :customizable_fields, presence: true
end
