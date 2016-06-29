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
#  restaurant_id            :integer
#  menu_id                  :integer
#  short_description        :string
#  order_id                 :integer
#

class Meal < ActiveRecord::Base
  before_save :default_values

  belongs_to :category
  belongs_to :order

  has_many :meal_sizes, dependent: :destroy
  has_many :supplementals, dependent: :destroy

  accepts_nested_attributes_for :meal_sizes,
                                allow_destroy: true,
                                reject_if: :all_blank
  accepts_nested_attributes_for :supplementals,
                                allow_destroy: true,
                                reject_if: :all_blank

  has_attached_file :meal_avatar, styles: { small: '80x80#', large: '250x250#' }, default_url: '/images/:style/missing.png'
  validates_attachment_content_type :meal_avatar, content_type: /\Aimage\/.*\Z/

  def default_values
    self.short_description ||= ''
  end
end
