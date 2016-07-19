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
#

require 'rails_helper'

RSpec.describe PermissionRole, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
