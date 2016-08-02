# frozen_string_literal: true
class AddCurrencyToRestaurants < ActiveRecord::Migration
  def change
    add_column :restaurants, :locale, :string
  end
end
