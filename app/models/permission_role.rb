class PermissionRole < ActiveRecord::Base
  belongs_to :permission
  belongs_to :role
  belongs_to :restaurant
end
