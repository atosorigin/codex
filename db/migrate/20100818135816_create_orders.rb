class CreateOrders < ActiveRecord::Migration
  def self.up
    create_table :orders do |t|
      t.string :payment_status
      t.references :user

      t.timestamps
    end
  end

  def self.down
    drop_table :orders
  end
end
