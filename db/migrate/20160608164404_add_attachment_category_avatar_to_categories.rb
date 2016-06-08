class AddAttachmentCategoryAvatarToCategories < ActiveRecord::Migration
  def self.up
    change_table :categories do |t|
      t.attachment :category_avatar
    end
  end

  def self.down
    remove_attachment :categories, :category_avatar
  end
end
