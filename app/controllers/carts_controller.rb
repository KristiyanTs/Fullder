class CartsController < ApplicationController
  before_action :authenticate_user!
  def show
    @order_items = current_order.order_items
    respond_to do |format|
      format.html
      format.json {render  json: current_order}
    end
  end
end
