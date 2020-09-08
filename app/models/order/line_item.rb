class Order::LineItem < ApplicationRecord
  validates :order_id, :name, :price, presence: true

  belongs_to :order
end
