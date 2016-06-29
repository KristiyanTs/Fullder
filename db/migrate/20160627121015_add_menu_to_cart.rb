class AddMenuToCart < ActiveRecord::Migration
  def change
    add_column :carts, :menu_id, :integer
  end
end
