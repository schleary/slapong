class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.integer :total
      t.string :email
      t.string :address
      t.string :city
      t.string :zip
      t.string :cc_name
      t.string :cc_number
      t.date :cc_expiration
      t.integer :cc_cvv
      t.string :state

      t.timestamps
    end
  end
end
