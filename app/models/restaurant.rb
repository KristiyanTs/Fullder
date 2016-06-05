# == Schema Information
#
# Table name: restaurants
#
#  id           :integer          not null, primary key
#  name         :string
#  address      :string
#  description  :text
#  phone_number :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Restaurant < ActiveRecord::Base
  has_one :menu
  has_many :categories, through: :menu, dependent: :destroy
  has_many :meals, through: :categories, dependent: :destroy

  has_many :working_hours, dependent: :destroy
  has_many :positions, dependent: :destroy
  has_many :roles, through: :positions, dependent: :destroy

  # this will be used as a banner for a restaurant's show page. However, it is hard to scale
  # the width of the image as it is going to be different for different devices
  has_attached_file :restaurant_avatar, styles: { large: '300x300' }, default_url: '/images/:style/missing.png'
  validates_attachment_content_type :restaurant_avatar, content_type: /\Aimage\/.*\Z/
end
