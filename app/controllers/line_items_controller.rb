class LineItemsController < ApplicationController
  def create
    current_cart.add_item(item_id: params[:item_id])
  end
end
