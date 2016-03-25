class ChangeProdudctIdToShipId < ActiveRecord::Migration
  def change
    rename_column :carted_products, :product_id, :ship_id
  end
end
