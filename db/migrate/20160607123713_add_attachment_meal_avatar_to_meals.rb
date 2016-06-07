class AddAttachmentMealAvatarToMeals < ActiveRecord::Migration
  def self.up
    change_table :meals do |t|
      t.attachment :meal_avatar
    end
  end

  def self.down
    remove_attachment :meals, :meal_avatar
  end
end
