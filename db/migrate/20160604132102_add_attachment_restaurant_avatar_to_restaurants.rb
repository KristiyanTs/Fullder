# frozen_string_literal: true
class AddAttachmentRestaurantAvatarToRestaurants < ActiveRecord::Migration
  def self.up
    change_table :restaurants do |t|
      t.attachment :restaurant_avatar
    end
  end

  def self.down
    remove_attachment :restaurants, :restaurant_avatar
  end
end
