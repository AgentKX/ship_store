class AddSupplier < ActiveRecord::Migration
  def change
    add_column :Ships, :id, :text
  end
end
