
class ApplicationController < ActionController::Base
  include Pundit
  protect_from_forgery

  # protect_from_forgery with: :exception
   before_action :authenticate_user!

   before_action :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :user_type])
  end
  private
end

