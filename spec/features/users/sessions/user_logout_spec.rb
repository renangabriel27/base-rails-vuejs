require 'rails_helper'

describe 'User:logout', type: :feature do
  let(:user) { create(:user) }

  before do
    login_as(user, scope: :user)
    visit users_root_path
  end

  it 'displays success logout message' do
    click_link user.name
    click_link(sign_out_label)

    expect(page).to have_current_path new_user_session_path
    expect(page).to have_flash(:info, text: already_signed_out_message)
  end
end
