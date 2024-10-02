class Card < ApplicationRecord
    belongs_to :product
    belongs_to :client
    validates :activation_number, presence: true

    def cancel
        update(cancelled_at: Time.current)
    end
end
