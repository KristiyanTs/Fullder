# == Schema Information
#
# Table name: meals
#
#  id                       :integer          not null, primary key
#  name                     :string
#  created_at               :datetime         not null
#  updated_at               :datetime         not null
#  category_id              :integer
#  meal_avatar_file_name    :string
#  meal_avatar_content_type :string
#  meal_avatar_file_size    :integer
#  meal_avatar_updated_at   :datetime
#

class Meal < ActiveRecord::Base
  belongs_to :category

  has_many :meal_sizes, dependent: :destroy
  has_many :supplementals, dependent: :destroy
  has_many :orders

  has_attached_file :meal_avatar, styles: { small: '80x80#', large: '250x250#' }, default_url: '/images/:style/missing.png'
  validates_attachment_content_type :meal_avatar, content_type: /\Aimage\/.*\Z/
end
