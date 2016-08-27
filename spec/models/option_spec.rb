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

require 'rails_helper'

RSpec.describe Option, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
