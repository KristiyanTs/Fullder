class CartsController < ApplicationController

	def show

	end

	def create
		@user = current_user
		@user.create_cart(params[:cart])
	end

	private

	def cart_params
    params.require(:cart).permit(:restaurant_id, :table_number, :user_id)
	end

end
