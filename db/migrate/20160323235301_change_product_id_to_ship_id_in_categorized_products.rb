class ChangeProductIdToShipIdInCategorizedProducts < ActiveRecord::Migration
  def change
    rename_column :categorized_products, :product_id, :ship_id
  end
end
