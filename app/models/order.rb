class Order < ApplicationRecord
  validates :person_name, presence: true
end
