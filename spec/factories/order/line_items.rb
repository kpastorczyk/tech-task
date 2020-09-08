FactoryBot.define do
  factory :order_line_item, class: 'Order::LineItem' do
    order_id { 1 }
    name { "MyString" }
    price { 1 }
  end
end
