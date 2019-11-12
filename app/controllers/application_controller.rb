class ApplicationController < ActionController::Base
  layout :layout_by_resource

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def layout_by_resource
    devise_controller? ? 'layouts/devise/session' : 'layouts/users/application'
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |user| user.permit(:name, :email, :password) }
  end

  private

  def after_sign_in_path_for(*)
    users_root_path
  end

  def after_sign_out_path_for(*)
    new_user_session_path
  end
end
