class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.string :person_name, null: false

      t.timestamps
    end
  end
end
