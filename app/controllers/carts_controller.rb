class CartsController < ApplicationController
  def show
    @user = User.find(params[:id])
    @current_cart = @user.current_cart
  end

  def checkout
    current_cart.init_checkout
    redirect_to cart_path(@current_cart)
  end
end
