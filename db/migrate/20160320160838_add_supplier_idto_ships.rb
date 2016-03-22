class AddSupplierIdtoShips < ActiveRecord::Migration
  def change
    change_column :ships, :description, :text
  end
end
