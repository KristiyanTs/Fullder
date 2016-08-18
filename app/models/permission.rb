# frozen_string_literal: true
# == Schema Information
#
# Table name: permissions
#
#  id            :integer          not null, primary key
#  subject_class :string
#  action        :string
#  name          :string
#  description   :text
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class Permission < ActiveRecord::Base
  has_many :permission_roles, dependent: :destroy
  has_many :roles, through: :permission_roles
end
