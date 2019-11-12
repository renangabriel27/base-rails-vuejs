require 'rails_helper'

describe 'User:profile', type: :feature, js: true do
  let(:user) { create(:user) }

  before do
    login_as(user, scope: :user)
    visit edit_user_registration_path
  end

  context 'when data is valid' do
    it 'updates the user profile' do
      new_name = 'new_name'
      new_email = 'email@email.com'

      fill_in 'user_email', with: new_email
      fill_in 'user_name', with: new_name
      fill_in 'user_current_password', with: user.password
      upload_file('user_profile_image', FileSpecHelper.image.path)

      submit_form

      expect(page).to have_current_path edit_user_registration_path
      expect(page).to have_flash(:info, text: registrations_updated_message)
      expect(page).to have_field 'user_name', with: new_name
      expect(page).to have_field 'user_email', with: new_email
    end
  end

  context 'when data is invalid' do
    it 'does not update the user profile' do
      fill_in 'user_name', with: ''
      fill_in 'user_email', with: 'email'
      fill_in 'user_current_password', with: user.password
      upload_file('user_profile_image', FileSpecHelper.pdf.path)

      submit_form

      expect(page).to have_flash(:danger, text: default_error_message)
      expect(page).to have_message(blank_error_message, in: 'div.user_name')
      expect(page).to have_message(invalid_error_message, in: 'div.user_email')
      expect(page).to have_message(profile_image_error_message, in: 'div.user_profile_image')
      expect(page).to have_message(confirm_password_error_message, in: 'div.user_current_password')
    end
  end
end
