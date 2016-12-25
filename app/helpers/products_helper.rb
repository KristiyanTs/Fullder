# frozen_string_literal: true
module ProductsHelper
  def size_price(product, size)
    formatted_price(product.price + size.price, product.restaurant)
  end

  def product_price(product)
    if product.sizes.any?
      (t 'product.price-from').to_s + formatted_price(product.price, product.restaurant)
    else
      formatted_price(product.price, @restaurant)
    end
  end

  def common_alergens(prod, user)
    if prod && user 
      allergens = prod.allergen_list & user.allergen_list
      (t 'product.contains').to_s + allergens.to_sentence if allergens.any?
    end
  end
end
