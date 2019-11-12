require 'rails_helper'

describe 'User:registration', type: :feature do
  before do
    visit new_user_registration_path
  end

  context 'when data is valid' do
    let(:name) { 'name' }
    let(:password) { 'user123' }

    it 'register the user' do
      fill_in 'user_name', with: name
      fill_in 'user_email', with: 'email@gmail.com'
      fill_in 'user_password', with: password
      fill_in 'user_password_confirmation', with: password

      submit_form

      expect(page).to have_current_path users_root_path
      expect(page).to have_flash(:info, text: registrations_signed_up_message)

      within('a.nav-link') do
        expect(page).to have_content(name)
      end
    end
  end

  context 'when data is invalid' do
    it 'does not register the user' do
      fill_in 'user_name', with: ''
      fill_in 'user_email', with: 'email'
      fill_in 'user_password', with: ''
      submit_form

      expect(page).to have_flash(:danger, text: default_error_message)
      expect(page).to have_message(blank_error_message, in: 'div.user_name')
      expect(page).to have_message(invalid_error_message, in: 'div.user_email')
      expect(page).to have_message(blank_error_message, in: 'div.user_password')
    end
  end
end
