class AddShipIdToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :ship_id, :integer
  end
end
