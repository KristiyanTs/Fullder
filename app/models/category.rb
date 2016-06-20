# == Schema Information
#
# Table name: categories
#
#  id                           :integer          not null, primary key
#  menu_id                      :integer
#  age_restriction              :boolean
#  available_all_day            :boolean
#  created_at                   :datetime         not null
#  updated_at                   :datetime         not null
#  working_hour_id              :integer
#  name                         :string
#  category_avatar_file_name    :string
#  category_avatar_content_type :string
#  category_avatar_file_size    :integer
#  category_avatar_updated_at   :datetime
#

class Category < ActiveRecord::Base
  belongs_to :menu

  has_many :meals, dependent: :destroy
  has_many :working_hours

  has_attached_file :category_avatar, styles: { small: '80x80#' }, default_url: '/images/:style/missing.png'
  validates_attachment_content_type :category_avatar, content_type: /\Aimage\/.*\Z/
  accepts_nested_attributes_for :meals
end
