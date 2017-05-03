class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_filter :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(
      :sign_up,
      keys: [:first_name, :last_name, :avatar]
    )
  end

  def after_sign_in_path_for(resource)
    user_ukuleles_path(current_user)
  end

  def after_sign_out_path_for(resource)
    root_path
  end
end
