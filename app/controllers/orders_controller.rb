class OrdersController < ApplicationController
  before_action :authenticate_user!

  def edit
    @order = current_order
  end

  def update
    @order = current_order
    @restaurant = Restaurant.find(session[:restaurant_id])
    @product = @restaurant.products.find(session[:product_id])
    params[:order][:table_id] = @restaurant.tables.find_by(number: params[:order][:table_id]).id
    respond_to do |format|
      if @order.update(order_params)
        format.html { redirect_to restaurant_product_path(@restaurant, @product), 
                flash: { notice: 'You now sit on table #{@order.table.number}' } }
        format.json { render :show, status: :ok, location: @restaurant }
      else
        format.html { render :edit }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def order_params
    params.require(:order).permit(:table_id)
  end
end
