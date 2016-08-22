# frozen_string_literal: true
module FooterHelper
  def button_link(button_link, button_class, button_content)
    button_content ||= ''
    link_to " " + button_content, button_link, class: button_class
  end
end
