# frozen_string_literal: true
class AddSellsOnlineToRestaurants < ActiveRecord::Migration
  def change
    add_column :restaurants, :sells_online, :boolean
  end
end
