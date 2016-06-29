class AddSupplementalsToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :supplementals_ids, :integer
  end
end
