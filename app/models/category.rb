# == Schema Information
#
# Table name: categories
#
#  id                  :integer          not null, primary key
#  restaurant_id       :integer
#  name                :string
#  age_restriction     :boolean
#  available_all_day   :boolean
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  avatar_file_name    :string
#  avatar_content_type :string
#  avatar_file_size    :integer
#  avatar_updated_at   :datetime
#

class Category < ActiveRecord::Base
  belongs_to :restaurant
  has_many :products
  
  has_attached_file :avatar, styles: { small: '80x80#' }, default_url: '/images/:style/missing.png'
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/
end
