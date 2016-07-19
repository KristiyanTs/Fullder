# frozen_string_literal: true
class AddAttachmentCategoryAvatarToCategories < ActiveRecord::Migration
  def self.up
    change_table :categories do |t|
      t.attachment :avatar
    end
  end

  def self.down
    remove_attachment :categories, :avatar
  end
end
