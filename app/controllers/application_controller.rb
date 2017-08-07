class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_cart, :current_user

  def current_cart
    if current_user
      current_user.current_cart
    end
  end

  def after_sign_out_path_for(resource_or_scope)
    store_path
  end
end
