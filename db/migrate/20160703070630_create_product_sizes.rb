class CreateProductSizes < ActiveRecord::Migration
  def change
    create_table :product_sizes do |t|
      t.references :product, index: true, foreign_key: true
      t.string :name
      t.decimal :price
      t.string :short_description

      t.timestamps null: false
    end
  end
end
