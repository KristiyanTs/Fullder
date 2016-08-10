class CreateProductOptions < ActiveRecord::Migration[5.0]
  def up
    create_table :product_options do |t|
      t.string :name
      t.references :product, foreign_key: true

      t.timestamps
    end
    ProductOption.create_translation_table! name: :string
  end

  def down
    drop_table :product_options
    ProductOption.drop_translation_table!
  end
end
