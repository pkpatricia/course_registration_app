class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  layout :layout_chooser

  protected

  def layout_chooser
    if is_admin_route?
      "admin"
    else
      "application"
    end
  end

  def is_admin_route?
    request.url =~ /admin/
  end
end
