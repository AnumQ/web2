class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.text :order_details
      t.integer :user_id
      t.integer :cart_id
      t.string :pay_type

      t.timestamps
    end
  end
end
