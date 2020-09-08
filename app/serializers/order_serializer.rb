class OrderSerializer < ActiveModel::Serializer
  attributes :id, :person_name, :created_at, :value, :line_items

  def line_items
    object.line_items.map do |line_item|
      ::Order::LineItemSerializer.new(line_item).attributes
    end
  end
end
