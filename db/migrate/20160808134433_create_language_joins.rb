class CreateLanguageJoins < ActiveRecord::Migration[5.0]
  def change
    create_table :language_joins do |t|
      t.references :language, foreign_key: true
      t.references :restaurant, foreign_key: true

      t.timestamps
    end
  end
end
