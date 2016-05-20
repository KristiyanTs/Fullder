class Position < ActiveRecord::Base
  has_many :roles
  belongs_to :user
  belongs_to :restaurant
end
