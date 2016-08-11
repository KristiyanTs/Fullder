class CreateProductOptionGroups < ActiveRecord::Migration[5.0]
  def up
    create_table :product_option_groups do |t|
      t.string :name
      t.integer :maximum
      t.references :product, foreign_key: true

      t.timestamps
    end
    ProductOptionGroup.create_translation_table! name: :string
  end

  def down
    drop_table :product_option_groups
    ProductOptionGroup.drop_translation_table!
  end  
end
