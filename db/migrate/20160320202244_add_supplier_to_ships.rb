class AddSupplierToShips < ActiveRecord::Migration
  def change
   add_column :ships, :supplier_id, :text
  end
end
