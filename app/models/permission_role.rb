# frozen_string_literal: true
# == Schema Information
#
# Table name: permission_roles
#
#  id            :integer          not null, primary key
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  permission_id :integer
#  role_id       :integer
#  restaurant_id :integer
#

class PermissionRole < ActiveRecord::Base
  belongs_to :permission
  belongs_to :role
end
