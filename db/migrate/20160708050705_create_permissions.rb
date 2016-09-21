# frozen_string_literal: true
class CreatePermissions < ActiveRecord::Migration
  def change
    create_table :permissions do |t|
      t.string :subject_class,   null: false # model name
      t.string :action,          null: false # controller action
      t.string :name,            null: false # user understandable action name
      t.text :description,       null: false # permission description

      t.timestamps null: false
    end
  end
end
