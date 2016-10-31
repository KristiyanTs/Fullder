class AddWeightToProducts < ActiveRecord::Migration[5.0]
  def change
    add_column :products, :weight, :string
  end
end
