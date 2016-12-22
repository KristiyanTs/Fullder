class CreateProblems < ActiveRecord::Migration[5.0]
  def change
    create_table :problems do |t|
      t.string :email
      t.string :title
      t.text :description

      t.timestamps
    end
  end
end
