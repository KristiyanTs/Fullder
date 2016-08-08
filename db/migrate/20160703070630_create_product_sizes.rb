class CreateProductSizes < ActiveRecord::Migration
  def up
    create_table :product_sizes do |t|
      t.references :product, index: true, foreign_key: true
      t.string :name
      t.decimal :price
      t.string :short_description

      t.timestamps null: false
    end
    ProductSize.create_translation_table! name: :string, short_description: :string
  end

  def down
    drop_table :product_sizes
    ProductSize.drop_translation_table!
  end
end
