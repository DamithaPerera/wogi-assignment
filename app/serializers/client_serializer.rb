class ClientSerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :payout_rate
end
