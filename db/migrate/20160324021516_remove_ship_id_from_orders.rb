class RemoveShipIdFromOrders < ActiveRecord::Migration
  def change
    remove_column :orders, :ship_id, :integer
  end
end
