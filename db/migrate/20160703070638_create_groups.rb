# frozen_string_literal: true
class CreateGroups < ActiveRecord::Migration[5.0]
  def up
    create_table :groups do |t|
      t.references :product,        index: true, foreign_key: true
      t.integer :maximum
      t.string :name

      t.timestamps
    end
    Group.create_translation_table! name: :string
  end

  def down
    drop_table :groups
    Group.drop_translation_table!
  end
end
