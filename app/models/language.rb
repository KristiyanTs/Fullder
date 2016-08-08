# == Schema Information
#
# Table name: languages
#
#  id         :integer          not null, primary key
#  locale     :string
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Language < ApplicationRecord
  has_many :language_joins
  has_many :restaurant, through: :language_joins
end
