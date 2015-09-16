class CreateOrderItems < ActiveRecord::Migration
  def change
    create_table :order_items do |t|
      t.integer :quantity
      t.integer :subtotal
      t.integer :subtotal
      t.integer :order_id
      t.integer :product_id
      t.string :status

      t.timestamps
    end
  end
end
