class Card < ApplicationRecord
    belongs_to :product
    belongs_to :client
    def cancel
        update(cancelled_at: Time.now)
    end
end
