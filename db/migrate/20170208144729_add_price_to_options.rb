class AddPriceToOptions < ActiveRecord::Migration[5.0]
  def change
    add_column :options, :price, :decimal, default: 0.0, null: false
  end
end
