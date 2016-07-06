class ProductDecorator < Draper::Decorator
  delegate_all

  def prices(obj)
    lowest = h.lowest_price(obj.product_sizes) + obj.price
    highest = h.highest_price(obj.product_sizes) + obj.price
    if lowest == highest
      lowest
    else
      lowest.to_s + ' - ' + highest.to_s
    end
  end
end
