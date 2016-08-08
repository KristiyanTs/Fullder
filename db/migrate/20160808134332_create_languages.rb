class CreateLanguages < ActiveRecord::Migration[5.0]
  def change
    create_table :languages do |t|
      t.string :locale
      t.string :name

      t.timestamps
    end
  end
end
