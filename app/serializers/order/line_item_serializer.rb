class Order::LineItemSerializer < ActiveModel::Serializer
  attributes :id, :name, :price
end
