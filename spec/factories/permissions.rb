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

FactoryGirl.define do
  factory :permission do
    subject_class 'MyString'
    action 'MyString'
  end
end
