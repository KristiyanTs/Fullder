# frozen_string_literal: true
module ProductsHelper
  def product_size_price(product, product_size)
    number_to_currency(product.price + product_size.price, locale: @restaurant.country.to_sym)
  end

  def product_price(product)
    if product.product_sizes.any?
      "#{t 'product.price-from'}" + number_to_currency(product.price, locale: @restaurant.country.to_sym)
    else
      number_to_currency(product.price, locale: @restaurant.country.to_sym)
    end
  end

  def common_alergens(product, current_user)
    allergens = product.allergen_list & current_user.allergen_list
    "#{t 'product.contains'}" + allergens.to_sentence if allergens.any?
  end
end
