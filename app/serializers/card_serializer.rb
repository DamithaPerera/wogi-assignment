class CardSerializer < ActiveModel::Serializer
  attributes :id, :activation_number, :purchase_pin, :client_id, :product_id
end