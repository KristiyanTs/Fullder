class AddTableNumberToCarts < ActiveRecord::Migration
  def change
    add_column :carts, :table_number, :integer
  end
end
