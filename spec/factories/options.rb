# frozen_string_literal: true
# == Schema Information
#
# Table name: options
#
#  id         :integer          not null, primary key
#  group_id   :integer
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_options_on_group_id  (group_id)
#
# Foreign Keys
#
#  fk_rails_8caa9b444d  (group_id => groups.id)
#

FactoryGirl.define do
  factory :option do
    name 'MyString'
    group nil
  end
end
