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

class Role < ActiveRecord::Base
  belongs_to :restaurant

  has_many :positions
  has_many :users, through: :positions

  has_many :permission_roles
  has_many :permissions, through: :permission_roles
end
