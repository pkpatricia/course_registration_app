class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :devise_admin_layout

  protected

  def devise_admin_layout
    if devise_controller? && resource.class == Admin
      layout "admin"
    end
  end
end
