class ProductSerializer < ActiveModel::Serializer
  attributes :id, :name, :price, :currency, :brand_id
end
