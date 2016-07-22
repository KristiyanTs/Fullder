# frozen_string_literal: true
class OrderItemDecorator < ApplicationDecorator
  delegate_all
  

  def full_description
    object.product.name 
  end 
end
