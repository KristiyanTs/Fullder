# frozen_string_literal: true
module RestaurantsHelper
  def search_hint
    # "You can also try with tags like " + Restaurant.tag_counts_on(:tags).to_sentence
  end
end
