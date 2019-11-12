require 'rails_helper'

describe 'User:login', type: :feature do
  let(:user) { create(:user) }

  before do
    visit new_user_session_path
  end

  context 'when the login is valid' do
    it 'redirects to the users page' do
      fill_in 'user_email', with: user.email
      fill_in 'user_password', with: 'password'
      submit_form

      expect(page).to have_current_path users_root_path
      expect(page).to have_flash(:info, text: signed_in_message)
    end
  end

  context 'when the login is invalid' do
    let(:resource_name) { User.human_attribute_name(:email) }

    it 'displays the users error' do
      fill_in 'user_email', with: user.email
      fill_in 'user_password', with: 'passworda'
      submit_form

      expect(page).to have_current_path new_user_session_path
      expect(page).to have_flash(:warning, text: devise_invalid_error_message(resource_name))
    end
  end

  context 'when the user is not authenticated' do
    before do
      visit users_root_path
    end

    it 'redirect to login page' do
      expect(page).to have_current_path new_user_session_path
      expect(page).to have_flash(:warning, text: unauthenticated_message)
    end
  end
end
