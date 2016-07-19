# frozen_string_literal: true
class AddColumnToPosition < ActiveRecord::Migration
  def change
    add_column :positions, :user_id, :integer
    add_column :positions, :role_id, :integer
    add_column :positions, :restaurant_id, :integer
  end
end
