module ProductsHelper

  def product_price(product, product_size)
    number_to_currency(product.price + product_size.price)
  end

  def product_size_radio_label

  end

end
