# frozen_string_literal: true
class CreateOptions < ActiveRecord::Migration[5.0]
  def up
    create_table :options do |t|
      t.references :group,           foreign_key: true
      t.string :name

      t.timestamps
    end
    Option.create_translation_table! name: :string
  end

  def down
    drop_table :options
    Option.drop_translation_table!
  end
end
