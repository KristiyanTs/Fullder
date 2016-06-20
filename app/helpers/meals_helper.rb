module MealsHelper
  def lowest_price(obj)
    obj.order(:price).first.price
  end

  def highest_price(obj)
    obj.order(:price).last.price
  end
end
