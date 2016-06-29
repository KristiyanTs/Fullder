class FixSupplementalsName < ActiveRecord::Migration
  def change
    rename_column :orders, :supplementals_ids, :supplemental_id
  end
end
