class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.integer :status, default: 0
      t.string :name
      t.string :email
      t.text :address
      t.text :payment

      t.timestamps
    end
  end
end
