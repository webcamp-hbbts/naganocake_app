class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|

      t.integer :customer_id
      t.integer :shipping_price
      t.integer :billing
      t.integer :payment_method, default: 0
      t.string :name
      t.string :address
      t.string :postcode
      t.integer :status, default: 0
      t.timestamps
    end
  end
end
