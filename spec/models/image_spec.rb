# frozen_string_literal: true
# == Schema Information
#
# Table name: images
#
#  id               :integer          not null, primary key
#  restaurant_id    :integer
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  pic_file_name    :string
#  pic_content_type :string
#  pic_file_size    :integer
#  pic_updated_at   :datetime
#
# Indexes
#
#  index_images_on_restaurant_id  (restaurant_id)
#
# Foreign Keys
#
#  fk_rails_2b7d98327c  (restaurant_id => restaurants.id)
#

require 'rails_helper'

RSpec.describe Image, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
