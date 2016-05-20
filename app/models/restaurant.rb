class Restaurant < ActiveRecord::Base
  has_many :working_hours
  has_many :positions
  has_many :roles, through: :positions
end
