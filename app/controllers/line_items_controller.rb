class LineItemsController < ApplicationController
  def create
    if current_user
      current_user.create_current_cart unless current_user.current_cart
      current_user.current_cart.add_item(params[:item_id]).save
      redirect_to cart_path(current_cart)
    else
      redirect back, notice: "You must be logged in!"
    end
  end
end
