class AlterTableProducts < ActiveRecord::Migration
  def change
    rename_table :products, :ships
  end
end
