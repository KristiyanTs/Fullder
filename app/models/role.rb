class Role < ActiveRecord::Base
  belongs_to :restaurant

  has_many :positions
  has_many :users, through: :positions

  has_many :permission_roles
  has_many :permissions, through: :permission_roles
end
