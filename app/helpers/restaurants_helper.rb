# frozen_string_literal: true
module RestaurantsHelper
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
    number_to_currency(price, locale: restaurant.country.to_sym)
  end

end
