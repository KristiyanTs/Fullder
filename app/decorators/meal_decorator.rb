class MealDecorator < Draper::Decorator
  delegate_all

  def prices(obj)
    lowest = h.lowest_price(obj.meal_sizes)
    highest = h.highest_price(obj.meal_sizes)
    if lowest == highest
      lowest
    else
      lowest.to_s + " - " + highest.to_s
    end
  end

end
