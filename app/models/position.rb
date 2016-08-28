# frozen_string_literal: true
# == Schema Information
#
# Table name: positions
#
#  id            :integer          not null, primary key
#  restaurant_id :integer
#  user_id       :integer
#  role_id       :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
# Indexes
#
#  index_positions_on_restaurant_id  (restaurant_id)
#  index_positions_on_role_id        (role_id)
#  index_positions_on_user_id        (user_id)
#
# Foreign Keys
#
#  fk_rails_4e4581e38b  (user_id => users.id)
#  fk_rails_50ecf01a29  (restaurant_id => restaurants.id)
#  fk_rails_60d189a78f  (role_id => roles.id)
#

class Position < ApplicationRecord
  belongs_to :role
  belongs_to :user
  belongs_to :restaurant

  validates :user_id, uniqueness:
      { scope: :restaurant_id, message: ' should have only one position in this restaurant' }

  scope :search, -> (keyword) do
    keyword = "%#{keyword}%"
    joins(:user, :role)
      .where('users.first_name ilike ? or users.last_name ilike ? or roles.name ilike ?',
             keyword, keyword, keyword) if keyword
  end
end
