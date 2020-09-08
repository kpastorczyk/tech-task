class Order < ApplicationRecord
  validates :person_name, presence: true

  has_many :line_items

  def value
    line_items.sum(:price)
  end
end
