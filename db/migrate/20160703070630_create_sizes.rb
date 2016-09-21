# frozen_string_literal: true
class CreateSizes < ActiveRecord::Migration[5.0]
  def up
    create_table :sizes do |t|
      t.references :product,           foreign_key: true
      t.string :name,                  null: false
      t.decimal :price,                null: false, default: 0
      t.string :description

      t.timestamps
    end
    Size.create_translation_table!     name: :string, description: :string
  end

  def down
    drop_table :sizes
    Size.drop_translation_table!
  end
end
