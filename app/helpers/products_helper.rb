# frozen_string_literal: true
module ProductsHelper
  def size_price(product, size)
    number_to_currency(product.price + size.price, locale: @restaurant.country.to_sym)
  end

  def product_price(product)
    if product.sizes.any?
      (t 'product.price-from').to_s + number_to_currency(product.price, locale: @restaurant.country.to_sym)
    else
      number_to_currency(product.price, locale: @restaurant.country.to_sym)
    end
  end

  def common_alergens(prod, user)
    if prod && user 
      allergens = prod.allergen_list & user.allergen_list
      (t 'product.contains').to_s + allergens.to_sentence if allergens.any?
    end
  end
end
