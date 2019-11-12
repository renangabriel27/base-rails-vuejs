class Users::RegistrationsController < Devise::RegistrationsController
  layout 'layouts/users/application'

  add_breadcrumb I18n.t('breadcrumbs.homepage'), :users_root_path

  add_breadcrumb I18n.t('breadcrumbs.users.edit_profile'),
                 :edit_user_registration_path,
                 only: [:edit]

  protected

  def after_update_path_for(*)
    edit_user_registration_path
  end

  def account_update_params
    params.require(:user).permit(:name, :email, :password,
                                 :profile_image,
                                 :profile_image_cache,
                                 :password_confirmation,
                                 :current_password)
  end
end
