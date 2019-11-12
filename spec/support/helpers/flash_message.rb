module Helpers
  module FlashMessage
    def errors_message
      I18n.t('flash.actions.errors')
    end

    def blank_error_message
      I18n.t('errors.messages.blank')
    end

    def invalid_error_message
      I18n.t('errors.messages.invalid')
    end

    def devise_invalid_error_message(resource_name)
      I18n.t('devise.failure.invalid', authentication_keys: resource_name)
    end

    def registrations_updated_message
      I18n.t('devise.registrations.updated')
    end

    def default_error_message
      I18n.t('simple_form.error_notification.default_message')
    end

    def confirm_password_error_message
      I18n.t('devise.registrations.edit.current_password_to_confirm')
    end

    def signed_in_message
      I18n.t('devise.sessions.signed_in')
    end

    def unauthenticated_message
      I18n.t('devise.failure.unauthenticated')
    end

    def already_signed_out_message
      I18n.t('devise.sessions.already_signed_out')
    end

    def registrations_signed_up_message
      I18n.t('devise.registrations.signed_up')
    end

    def message(key)
      I18n.t("flash.actions.#{key}", resource_name: resource_name)
    end

    def invalid_url_message
      I18n.t('activerecord.errors.videos.url.extension')
    end

    def profile_image_error_message
      I18n.t('errors.messages.extension_whitelist_error', extension: '"pdf"',
                                                          allowed_types: 'jpg, jpeg, gif, png')
    end
  end
end
