module ApplicationHelper
  def current_cart
    if current_user
      current_user.current_cart
    end
  end
end
