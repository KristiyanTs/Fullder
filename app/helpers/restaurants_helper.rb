# frozen_string_literal: true
module RestaurantsHelper
  def greet
    name = current_user.try(:name) || ""
    now = Time.now
    today = Date.today.to_time

    morning = today.beginning_of_day
    noon = today.noon
    evening = today.change( hour: 17 )
    night = today.change( hour: 20 )
    tomorrow = today.tomorrow

    if (morning..noon).cover? now
      name.empty? ? 'Good morning. Would you like to ' + (link_to 'log in', new_user_session_path) + ' before we continue?' : 'Good morning, ' + name
    elsif (noon..evening).cover? now
      name.empty? ? 'Good afternoon. Would you like to ' + (link_to 'log in', new_user_session_path) + ' before we continue?' : 'Good afternoon,' + name
    elsif (evening..night).cover? now
      name.empty? ? 'Good evening. Would you like to ' + (link_to 'log in', new_user_session_path) + ' before we continue?' : 'Good evening,' + name
    elsif (night..tomorrow).cover? now
      name.empty? ? 'Good night. Would you like to ' + (link_to 'log in', new_user_session_path) + ' before we continue?' : 'Good night,' + name
    end
  end

  def status(res)
    if res.working?
      u = res.working_times.select(&:active_now?).first
      I18n.t(:"date.abbr_day_names")[u.from_day] + "   " + 
             u.from_time.to_formatted_s(:time) + "-" + 
             u.to_time.to_formatted_s(:time)
    else
      I18n.t('restaurant.closed')
    end
  end


  def formatted_price(price, restaurant)
    restaurant ||= Restaurant.new
    number_to_currency(price, locale: restaurant.country.to_sym)
  end

end
