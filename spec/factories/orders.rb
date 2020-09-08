FactoryBot.define do
  factory :order do
    person_name { "MyString" }
  end

  trait :with_line_item do
    after(:create) do |order|
      order.line_items << create_list(:order_line_item, 1, order: order)
    end
  end
end
