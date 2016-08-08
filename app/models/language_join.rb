# == Schema Information
#
# Table name: language_joins
#
#  id            :integer          not null, primary key
#  language_id   :integer
#  restaurant_id :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
# Indexes
#
#  index_language_joins_on_language_id    (language_id)
#  index_language_joins_on_restaurant_id  (restaurant_id)
#
# Foreign Keys
#
#  fk_rails_ba9e807b4f  (restaurant_id => restaurants.id)
#  fk_rails_c4c27b2e55  (language_id => languages.id)
#

class LanguageJoin < ApplicationRecord
  belongs_to :language
  belongs_to :restaurant
end
