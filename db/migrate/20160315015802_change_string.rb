class ChangeString < ActiveRecord::Migration
  def change
    change_column :ships, :description, :text
    remove_column :ships, :price
  end
end
