# frozen_string_literal: true
# == Schema Information
#
# Table name: roles
#
#  id            :integer          not null, primary key
#  name          :string
#  restaurant_id :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
# Indexes
#
#  index_roles_on_restaurant_id  (restaurant_id)
#
# Foreign Keys
#
#  fk_rails_a5d1cc5ecc  (restaurant_id => restaurants.id)
#

class Role < ApplicationRecord
  belongs_to :restaurant

  has_many :positions, dependent: :destroy
  has_many :users, through: :positions

  has_many :permission_roles, dependent: :destroy
  has_many :permissions, through: :permission_roles

  accepts_nested_attributes_for :permissions

  before_destroy :check_for_positions

  private

  def check_for_positions
    if positions.any?
      errors[:base] << 'Cannot delete roles which are currently assigned.'
      false
    end
  end

  scope :search, -> (keyword) do
    unless keyword.blank?
      keyword = "%#{keyword}%"
      where('roles.name ilike ?', keyword)
    end
  end
end
