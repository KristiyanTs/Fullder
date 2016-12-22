# == Schema Information
#
# Table name: problems
#
#  id          :integer          not null, primary key
#  email       :string
#  title       :string
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Problem < ApplicationRecord
end
