# == Schema Information
#
# Table name: images
#
#  id               :integer          not null, primary key
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  pic_file_name    :string
#  pic_content_type :string
#  pic_file_size    :integer
#  pic_updated_at   :datetime
#  restaurant_id    :integer
#
# Indexes
#
#  index_images_on_restaurant_id  (restaurant_id)
#
# Foreign Keys
#
#  fk_rails_2b7d98327c  (restaurant_id => restaurants.id)
#

class Image < ApplicationRecord
  belongs_to :restaurant

  has_attached_file :pic, styles: { medium: "200x200#"}, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :pic, content_type: /\Aimage\/.*\Z/
end
