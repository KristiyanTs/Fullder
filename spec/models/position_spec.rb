# == Schema Information
#
# Table name: positions
#
#  id              :integer          not null, primary key
#  user_id         :integer
#  restaurant_id   :integer
#  role            :string
#  description     :text
#  create_meal     :boolean
#  edit_menu       :boolean
#  create_position :boolean
#  edit_position   :boolean
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

require 'rails_helper'

RSpec.describe Position, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
