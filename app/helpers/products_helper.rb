module ProductsHelper
  def product_price(product, product_size)
    number_to_currency(product.price + product_size.price)
  end

  def lowest_price(obj)
    obj.order(:price).first.price
  end

  def highest_price(obj)
    obj.order(:price).last.price
  end
end
