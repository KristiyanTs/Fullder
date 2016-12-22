# frozen_string_literal: true
module ApplicationHelper

  def shorthand(text, max_symbols)
    text ||= ""
    text.length > max_symbols ? text[0,max_symbols-3] + '...' : text
  end

end
