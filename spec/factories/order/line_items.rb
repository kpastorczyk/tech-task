FactoryBot.define do
  factory :order_line_item, class: 'Order::LineItem' do
    name { "MyString" }
    price { 1 }
  end
end
