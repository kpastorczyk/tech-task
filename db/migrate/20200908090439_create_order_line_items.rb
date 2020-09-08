class CreateOrderLineItems < ActiveRecord::Migration[6.0]
  def change
    create_table :order_line_items do |t|
      t.integer :order_id
      t.string :name, null: false
      t.integer :price, null: false

      t.timestamps
    end
  end
end
